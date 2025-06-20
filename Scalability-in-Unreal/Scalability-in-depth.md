[Start](../Index.md) | [Previous](Unreal-ini-Files.md) | [Next](Benchmark-AutoDetect-Scalability.md)

# `Scalability.ini` in-depth

For the `Scalability.ini` file there's a fully commented version that is distributed with every version of Unreal Engine.
See `(Unreal Folder)/Engine/Config/BaseScalability.ini`.

In this section, we'll only look at a reduced version.

The `Scalability.ini` file can be used to really fine-tune the scalability settings of your project.
However, it is worth starting with the defaults and adjusting them when needed.
There are ways to use these defaults with modern machines, as we'll see in the next part.

## Section `ScalabilitySettings`

This section is used to determine the quality level for each scalability group using the benchmark results for the CPU and the GPU.

The `PerfIndexThresholds` are composed of four different fields:

- The type of the comparison. 
  This can be `GPU`, `CPU`, `Min`.
  Depending on this field, Unreal will look at the GPU benchmark result, the CPU benchmark result, or the minimum of both values.
- The threshold for the _Medium_ quality level.
  If the benchmark value is higher than this value, Unreal will apply the _Medium_ quality level settings for this scalability group.
- The threshold for the _High_ quality level.
- The threshold for the _Epic_ quality level.

If a benchmark value is below the _Medium_ threshold, Unreal will apply the _Low_ quality level settings for this scalability group.

The _Cine_ quality level is a special case, as it will never be applied automatically.

```ini
[ScalabilitySettings]
PerfIndexThresholds_ResolutionQuality="GPU 18 42 115"
PerfIndexThresholds_ViewDistanceQuality="Min 18 42 105"
PerfIndexThresholds_AntiAliasingQuality="GPU 18 42 115"
PerfIndexThresholds_ShadowQuality="Min 18 42 105"
PerfIndexThresholds_GlobalIlluminationQuality="GPU 18 42 115"
PerfIndexThresholds_ReflectionQuality="GPU 18 42 115"
PerfIndexThresholds_PostProcessQuality="GPU 18 42 115"
PerfIndexThresholds_TextureQuality="GPU 18 42 115"
PerfIndexThresholds_EffectsQuality="Min 18 42 105"
PerfIndexThresholds_FoliageQuality="GPU 18 42 115"
PerfIndexThresholds_ShadingQuality="GPU 18 42 115"
```

In addition to the thresholds, _Resolution Quality_ is a special case as it uses the screen percentage.
To do that, you can adjust the `PerfIndexValues_ResolutionQuality` setting, which is composed of five numeric values:

- Screen percentage of the _Low_ quality level.
- Screen percentage of the _Medium_ quality level.
- Screen percentage of the _High_ quality level.
- Screen percentage of the _Epic_ quality level.
- Screen percentage of the _Cine_ quality level.

```ini
PerfIndexValues_ResolutionQuality="50 71 87 100 100"
```

## Section `ResolutionQuality`

I still need to learn about this section myself.
Consider this part of the documentation incomplete.

```ini
[ResolutionQuality]
!ResolutionPresets=CLEAR_ARRAY
; Use the project's default screen percentage
+ResolutionPresets=(Name="Default",ResolutionQuality=0.0)
; 1080.0f / 2160.0f = 50%
+ResolutionPresets=(Name="Performance",ResolutionQuality=50.0)
; 1260.0f / 2160.0f - 0.1f / 2160.0f = 58.328%
+ResolutionPresets=(Name="Balanced",ResolutionQuality=58.328)
; 1440.0f / 2160.0f - 0.1f / 2160.0f = 66.662%
+ResolutionPresets=(Name="Quality",ResolutionQuality=66.662)
; 2160.0f / 2160.0f = 100%
+ResolutionPresets=(Name="Native",ResolutionQuality=100.0)
```

## Scalability Group Quality Sections

These are sections for each scalability group and quality level.

The section name is composed of the scalability group and the quality level like this: `[ScalabilityGroup@QualityLevel]`.
Instead of the named quality level, this uses the numeric value:

- _Low_: `0`
- _Medium_: `1`
- _High_: `2`
- _Epic_: `3`
- _Cine_: `Cine` (Exception)

The contents of the individual sections are the console variable overrides, which can be seen in the _AntiAliasingQuality_ sections.
As you can see in this example, the quality increases with the quality level.

```ini
[AntiAliasingQuality@0]
r.FXAA.Quality=0
r.TemporalAA.Quality=0
...

[AntiAliasingQuality@1]
r.FXAA.Quality=1
r.TemporalAA.Quality=1
...

[AntiAliasingQuality@2]
r.FXAA.Quality=3
r.TemporalAA.Quality=1
...

[AntiAliasingQuality@3]
[AntiAliasingQuality@Cine]

[ViewDistanceQuality@0]
[ViewDistanceQuality@1]
[ViewDistanceQuality@2]
[ViewDistanceQuality@3]
[ViewDistanceQuality@Cine]
...
```

[Next &rarr;](Benchmark-AutoDetect-Scalability.md)