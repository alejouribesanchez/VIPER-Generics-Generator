# VIPER-Generics-Generator iOS Architecture Pattern Swift 3.0

A generator of classes with protocols to comunicate over VIPER

Based on templates created on [Clean Swift](http://clean-swift.com/) by [@rayvinly](https://twitter.com/rayvinly)

With the concepts of VIPER from [objc.io](https://www.objc.io/issues/13-architecture/viper/#interactor)

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/viper.png)


to install:

1. Open terminal and do the next.

`cd Templates && make install_templates`

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step1.png)

2. Add the file **RoutingProtocol.swift** to your project.

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step2.png)

3. New File and select VIPER Scene and NEXT.

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step3.png)

4. Choose name and done!

![alt tag](https://github.com/alejouribesanchez/VIPER-Generics-Generator/blob/master/Images/step4.png)

5. Configure your appDelegate to load first your routing or See the example project.

`self.window = UIWindow()` 
`self.window!.frame = UIScreen.main.bounds`
`let routing = ViperRouting()`
`try! routing.loadFromWindow(window: window!)`
`self.window!.makeKeyAndVisible()`

7. See our example to understand.
