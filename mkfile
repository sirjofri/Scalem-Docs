files=`{walk -f | grep 'index\.md$' | sed 's:\.md$:.html:' | grep -v '^out/'}
copymedia=`{walk -f | grep '\.png$' | grep -v '^out/'}

mkdflags=-f toc -f fencedcode -T -x
getfirsttitle='
/^#[ \t]/ {
	sub(/^#[ \t]+/, "")
	print
	exit
}
END {
	exit "not found"
}'
linkconv='s:href="([a-zA-Z0-9\-_\.\/]+\/)index.md:href="\1:g'

all:V: ${files:%=out/%} ${copymedia:%=out/%}

test:V:
	@{cd out && ../test/deadlinks.rc}

out/index.html:Q: index.md fragments/header.ht fragments/footer.ht
	mkdir -p `{basename -d $target}
	title=`{awk $"getfirsttitle <index.md}
	if(~ $#title 0)
		title="Scalem"
	{
		cat fragments/header.ht | sed 's/%TITLE%/'^$"title^'/g'
		markdown $mkdflags index.md
		cat fragments/footer.ht
	} | sed $"linkconv >$target
	echo √ gen $target

out/%/index.html:Q: %/index.md fragments/header.ht fragments/footer.ht
	mkdir -p `{basename -d $target}
	title=`{awk $"getfirsttitle <$stem/index.md}
	if(~ $#title 0)
		title="Scalem"
	{
		cat fragments/header.ht | sed 's/%TITLE%/'^$"title^'/g'
		markdown $mkdflags $stem/index.md
		cat fragments/footer.ht
	} | sed $"linkconv >$target
	echo √ gen $target

out/%.png:Q: %.png
	mkdir -p `{basename -d $target}
	cp $stem.png $target
	echo √ cpy `{basename $target}
