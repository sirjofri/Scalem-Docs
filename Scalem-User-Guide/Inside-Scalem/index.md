[Start](../../index.md) | [Previous](../Introduction/index.md) | [Next](../Window-Overview/index.md)

# Inside Scalem

To better understand Scalem, it is worth looking inside it.

## Runtime and Editor Time

Scalem comes with two separate code modules.
The runtime component is used in your packaged project to export the current settings.
This "Scalability Capture" is then included into the total calculation by the Scalem editor.
The capture contains the name of the target machine and a comment, as well as all the current settings that are relevant for scalability calculations.
It also contains the CPU and GPU benchmark results.

The editor module contains all the calculation functionality and tools.
It takes the data of the captures into account, as well as the `Scalability.ini` file and the target machine configuration.

Generally, most work will happen inside the Scalem editor.

## Rough Workflow Description

To prepare the next section, it's important to take a look at the rough workflow that is intended to be used with Scalem.

1. Package the project and distribute it to the target machine(s).
2. Run the project on the target machine.
3. Looking at the performance, adjust the scalability within the project to match your performance goal for that target machine.
4. Fine-tune the performance by overriding CVars.
5. Repeat steps 3 and 4 until you reach the target performance.
6. Run the `Scalem.Write` command to export the settings.
7. Copy the exported `.ini` file to your Scalem project folder.
8. In your main project, use the Scalem editor to adjust the scalability on your project.

These steps will be described in more detail later.

## Scalem Project Files

Scalem stores all its project files in a subfolder of your project folder, which is `(Unreal Project)/Scalem` (shortened to `(Scalem)` from now on).
This means that this folder will contain all the target machine configurations, all scalability captures, and the scalability presets.

Scalem also works with the `Scalability.ini` file of your project.
I'm planning to extend this functionality to also include the `BaseScalability.ini` file of the Unreal installation.

Since Scalem only uses the files in this folder, it is always possible for you to manipulate the files manually.
About this, some remarks:

- Target machines and Scalability Captures are matched by their `Name` field.
- The unique identifier for Scalability Captures is their timestamp in the `Timestamp` field.
  In the rare case that you encounter a name clash here, you can add a second to make the name unique.
- After manually changing the files, it's sometimes necessary to reopen the Scalem Editor.

> **Note**: While I try to keep Scalem as stable as possible, reloading data from `.ini` files can lead to bugs.
> Please report these bugs.
> 
> Manually reopening the Scalem Editor or even the Unreal editor can be used as a workaround.

## Target Machines and Scalability Captures

Target machines can be managed within the editor.
That means that you can create new target machines, as well as adjust existing ones.

Each target machine has a `.ini` file in your scalem project folder, named `MyTargetMachine.ini`.
The file contains basic info about the target machine, which is the name of the target machine and a comment.

In addition to that, the target machine contains the definition of the quality that this target machine should be capable of achieving.
This is defined by assigning each scalability group a quality level.

Note that this definition should include your technical performance goal, for example, 30 fps.
This performance goal is completely up to you, but I recommend that you include that in the comment.

Scalability captures are readonly within the editor, even though it's possible to manipulate the files in a text editor.
The files are also stored as `.ini` files and are in the same place as the target machines, their naming usually contains a timestamp like this: `MyTargetMachine_20250328.ini`.

The scalability capture contains the name of its target machine, the timestamp when this capture was made, a comment and the CPU and GPU benchmark values.

For the calculation, it contains the base quality levels which was initially set to achieve the rough target performance, and any CVar override variables that were set during the capture.

## `Scalability.ini` and Presets

Sometimes you need to go back and forth.
Sometimes you also have to compare different settings.

For this purpose, Scalem provides the option to maintain `Scalability.ini` preset files in the `(Scalem)/Presets` folder.
The exact names of these files are up to you (except for their file extension `.ini`), their contents follow exactly the `Scalability.ini` config files.

The Scalem editor provides the tools to manipulate these files.
It also allows you to quickly "copy over" a preset file to the project `DefaultScalability.ini` file.

The individual different `Scalability.ini` files are called "scalability bundles" internally.

[Next](../Window-Overview/index.md)