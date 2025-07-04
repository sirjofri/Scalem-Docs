[← Previous](../index.md) | [Start](../index.md) | [Next →](../Scalability-in-Unreal/index.md)

# Terminology

In alphabetic order.

### Benchmark

> Benchmarking is the practice of comparing [...] performance metrics to industry bests and best practices from other companies. Dimensions typically measured are quality, time and cost.

&mdash; "Benchmarking," Wikipedia

In our context of Unreal scalability, Unreal uses a benchmarking process to rate the performance of the CPU and the GPU.
These two numbers can be used to determine the best settings.

For both values, 100 is meant for a "standard, good" computer, which is hard to define for modern standards.

### Console Variable

Unreal systems have configurable parameters called Console Variables (CVars).
These can be set on the in-game console, using configuration files, or programmatically using code and Blueprints.

### Quality Level

Unreal uses the quality levels to group console variables together into units that can be applied as a bundle.

Unreal defines three (four) different quality levels: _Low_ (0), _Medium_ (1), _High_ (2), _Epic_ (3), _Cinematic_ (Cine, 4).

### Scalability Bundle (Scalem)

`DefaultScalability.ini`, `BaseScalability.ini` and the preset files are all "scalability bundles."

### Scalability Capture (Scalem)

This is a bundle of data captured on a specific target machine.
It contains the target machine name, a comment, the benchmark results and the current scalability settings.

### Scalability Group

Unreal defines different scalability groups for different areas.
Each scalability group has its own quality level, as well as its own bundle of console variables.
Example scalability groups are: Resolution Quality, Reflection Quality, Effects Quality, Global Illumination Quality.

### Target Machine

Target Machine refers to a specific machine under controlled conditions.
You usually want your project to perform on that machine with specific settings.

While it's rare that a user has a computer with the exact same configuration, there's a good chance that you can estimate the best settings based on the benchmarks on their computer.
For that purpose, you usually have multiple target machines with different hardware configurations and settings.

[Next →](../Scalability-in-Unreal/index.md)
