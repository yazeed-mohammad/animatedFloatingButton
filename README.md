[//]: # (# AnimatedFloatingButton)

[//]: # ([![Pub Version]&#40;https://img.shields.io/pub/v/calender_fetcher?color=green&label=pub.dev&logo=version&#41;]&#40;https://pub.dev/packages/calender_fetcher&#41;)

A Flutter package to use animatedFloatingButton.

## Features

- 🚀 Cross platform: mobile, desktop, browser
- ❤️ Simple
- 🎈 **NO** native dependencies

## Getting started
You can use AnimatedFloatingButton by calling ```AnimatedFloatingButton``` .


```
FloatingActionButtonPage(
  direction: ui.TextDirection.rtl,
  isDismissible: true,
  mainButtonColor: AppColors.pineGreen100,
  shadowColor: const Color(0xff1D1D1B).withOpacity(0.5),
  labelStyle: const TextStyle(color: Colors.white),
  childrenProps: [
    FloatingButtonProps(label: 'label', icon: Icons.abc, action: () => print('lable 1')),
    FloatingButtonProps(label: 'label2', customIcon: const Text('A'), action: () => print('lable 2')),
    FloatingButtonProps(label: 'label3', icon: Icons.access_time_outlined, action: () => print('lable 3')),
    FloatingButtonProps(label: 'label4', icon: Icons.add_alert, action: () => print('lable 4')),
  ],
)
```