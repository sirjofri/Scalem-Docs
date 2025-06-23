[Start](../index.md) | [Previous](../Scalability-in-Unreal.md) | [Next](Scalability-in-depth.md)

# Unreal INI Files: Introduction

## Different Levels of INI Files

Unreal describes multiple different "levels" of INI config files.
This is useful because if one config file is missing on a level, the configuration from the upper config file is used.

The individual config files contain settings for different project areas.
Some settings are important for the editor only, others are applied to the game.
In this documentation, we'll only focus on the `Scalability.ini` file.
If you need more information on the other files, check out the [official documentation](https://dev.epicgames.com/documentation/en-us/unreal-engine/configuration-files-in-unreal-engine).

In this section, the levels are described from lowest to highest priority.

### Base Configuration

This level of configuration comes with a standard installation of the Unreal Engine.
The files can therefore be found in the Installation folder: `(UE Folder)/Engine/Config/Base*.ini`.

As you noticed, the config files all start with `Base...`, which is a pattern that can be found in all the other levels, too.

### Default Configuration

The base configuration files contain all the settings that are applied to the engine by default.
They can be considered "sane," but sometimes you only need different settings for your project.

This is why your Unreal project has its own level of config files, which is applied to the whole project and usually shared with your team, using source control.
The files are stored in your project folder: `(Unreal Project)/Config/Default*.ini`.

### "Saved" Configuration

This level of configuration is a bit special, as they are applied project-wide, but aren't usually shared with the team.
The files are stored in the project folder: `(Unreal Project)/Saved/Config/Platform/*.ini`.

These settings aren't usually important for scalability purposes, but it's still important to mention them for the following reason:

The settings override the default settings.
This means that if you have overridden settings in your saved config, changing the same settings in the default config doesn't lead to the expected results in the editor.

However, the "saved" configuration is _not packaged_ with the game, so the default configuration takes effect in your packaged product.

The saved configuration is usually considered "temporary" as it contains information about your last editor state, which is very individual.
Ideally, you can remove all the configuration files in the `Saved` directory without losing any work or project-specific settings.

**What does that mean for you?**
If you ever notice that changing the default configuration in your project isn't applied in your editor, check the saved configuration.
You might have an override config file there.

### User Configuration

The user configuration can be found in `(Local App Data)/Unreal Engine/Engine/Config/User*.ini`.
It is usually quite empty.

### Platform Configuration

This is not a level in itself, but a separate layer on top of the other configuration levels.
It is possible to have platform-specific configuration overrides for each level.

I don't want to go into too much detail about this.
If you want to learn more, check the [official documentation](https://dev.epicgames.com/documentation/en-us/unreal-engine/configuration-files-in-unreal-engine) and see the examples of the base configuration.

## Config file contents

Unreal stores all its parameters in _console variables_ ("CVars").
Each console variable belongs to a specific category and configuration file.
The parameters can be set in their respective configuration file using their name.

It is also possible to override most console variables in the Unreal in-game console or using code (Blueprint or C++).
I recommend using this sparingly and controlled, as it overrides the settings in your config files.

[Next &rarr;](Scalability-in-depth.md)