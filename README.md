[//]: # (# AnimatedFloatingButton)

[//]: # ([![Pub Version]&#40;https://img.shields.io/pub/v/calender_fetcher?color=green&label=pub.dev&logo=version&#41;]&#40;https://pub.dev/packages/calender_fetcher&#41;)

A Flutter package to use animatedFloatingButton.

## Features

- 🚀 Cross platform: mobile, desktop, browser
- ❤️ Simple
- 🎈 **NO** native dependencies

## Getting started
You can use AnimatedFloatingButton by calling ```AnimatedFloatingButton``` .

to avoid shadow padding issue set floatingActionButtonLocation

```
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
```

Example
```
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedFloatingButton(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        childrenProps: [
          FloatingButtonProps(
            label: "First",
            icon: Icons.one_x_mobiledata,
            action: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("First"))),
          ),
          FloatingButtonProps(
            label: "Second",
            customIcon: const Text('2'),
            labelDecoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: const TextStyle(color: Colors.white),
            action: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Second"))),
          ),
        ],
      )
```