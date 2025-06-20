[Start](../Index.md) | [Previous](Introduction.md) | [Next](Windows-in-Detail.md)

# Scalem Window Overview

The main window for Scalem can be found in `Tools` &rarr; `Scalem Editor`.
The window contains multiple subwindows, some of which open automatically:

- Scalability Editor
- Machines and Captures
- Bar Plot
- Visual Scalability Editor
- Console Variables Editor
- Calculation Parameters
- Target Machine Editor
- Scalability Capture Viewer

The following sections will go through these individual windows in more detail.

## Main Window

The main window as it opens by default is split horizontally into two separate sides:

![Main Window]()

The left side can be thought of as the list and selection side.
It contains the window for selecting the scalability bundle and adjusting that (top).
The bottom window lists all your target machines and their scalability captures.
The scalability captures can be selected and show statistics about how they perform compared to their target and using the currently selected scalability bundle.

The right side is the "visual" side.
It contains the bar plot (top), which shows the performance of the selected scalability captures in detail.
The bottom window allows you to adjust the currently selected scalability bundle using sliders per scalability group.
It also draws the currently selected scalability bundles to make it easier to place the slider in the best spot.

> One of the biggest strengths of Scalem is that all the calculation is happening live, while editing.
> For example, when adjusting the sliders, you can see how all the data visualization changes to reflect these new values.
> This makes it easy to set up the scalability considering all your target machines.

The remaining windows only appear after summoning them manually using the `Window` menu, or after certain actions happen.

[Next &rarr;](Windows-in-Detail.md)
