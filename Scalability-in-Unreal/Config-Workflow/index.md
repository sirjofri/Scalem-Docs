[← Previous](../Benchmark-AutoDetect-Scalability/index.md) | [Start](../../index.md) | [Next →](../../Scalem-User-Guide/index.md)

# Configuration Workflow

Because every team works differently and every project has different conditions, it is impossible to have _one single_&trade; workflow.
Because of that, I can only describe a few tips that I think are important for you to find a workflow that works for you and your team.

## Define Useful Target Machines

Before starting to adjust the scalability, it is important to define the target machines.
This should happen as early as possible because these steps involve discussions with the business people and the directors.

Each project has a use group with business-"musts" and director-"wants."
Business-"musts" are restrictions about the product that must be met, for example, a game should be able to run on a computer of students with good performance.

Director-"wants" are restrictions about the product that specify the _quality_ (as well as the performance) on a specific target group.

> For example, you need to know if your product has to run on a business laptop with no dedicated graphics, and how good it needs to perform on it.
> It's possible that the project needs to run on a business laptop, but with lowest graphics and only 30 fps.
> However, if the project runs on a gaming machine, it should maybe reach 60 fps with highest graphics (Epic), or alternatively 40 fps with high quality settings.

> This can even become more complicated.
> For example, e-sports games could have other restrictions:
> A shooter might need to run on any hardware with 60 fps, and players with higher graphics settings shouldn't have an advantage by using reflections and detailed shadows.

It is very important to discuss this with the directors and the business people on your team to find all the necessary restrictions so you can define the target machines.
Ideally, you can order the target machines then, which also involves money, so the fewer machines you really need, the better.

A target machine definition should contain the hardware (and software) configuration, as well as the restrictions on the settings and the performance.
The first one is easy to get, since it's just the physical machine as it is.
The restrictions are harder to get, and you have to document them.

> It is also worth noting the difference between absolute _needs_ and their actual implementation.
> While the _needs_ are clearly discussed with the directors (e.g., 30 fps, high graphics), the actual implementation can be drastically different (What even means "high graphics"?).

## Start with the Base Configuration File, Use Benchmark Multipliers

Since Unreal comes with a base `Scalability.ini` file with mostly sane defaults, why not use them?
Ideally, you don't need to change these defaults in any way.

However, modern computers are way more powerful, and newer Unreal systems (especially Next-Gen features) need that power.
Because of that situation, you _have to_ adjust the thresholds&mdash;or not?

Use the benchmark multipliers to scale the benchmark results to better fit into the existing definition of a "standard, good" machine.
That way, you can use the existing `Scalability.ini` file without any changes, and still adjust it later if really needed.

If you really need to adjust the `Scalability.ini` file, copying the base config file to you default configuration is the best way to do it.
That way you can keep the default settings and adjust them where needed, and you always have the original config file for reference.

## Keep in Mind User Feedback

You can never take every single user machine into account, but if you get user feedback, take it seriously.
Be careful though, as users often have unrealistic expectations that don't match your plan.

[Next →](../../Scalem-User-Guide/index.md)