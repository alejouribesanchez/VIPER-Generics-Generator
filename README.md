# VIPER-Generics-Generator iOS Architecture Pattern Swift 3.0

##Concepts:

A generator of classes with protocols to comunicate over VIPER

Based on templates created on [Clean Swift](http://clean-swift.com/) by [@rayvinly](https://twitter.com/rayvinly)

With the concepts of VIPER from [objc.io](https://www.objc.io/issues/13-architecture/viper/#interactor)

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/viper.png)


##Install:

- Open terminal and do next commands

`cd Templates && make install_templates`

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step1.png)

- Add the file **RoutingProtocol.swift** to your project

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step2.png)

- New File and select VIPER Scene and NEXT

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step3.png)

- Choose name and finalize

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step4.png)

- Configure your appDelegate to load your routing or see the example project

```swift
self.window = UIWindow()
self.window!.frame = UIScreen.main.bounds
let routing = ViperRouting()
try! routing.loadFromWindow(window: window!)
self.window!.makeKeyAndVisible()
```


- See our example project to understand.
