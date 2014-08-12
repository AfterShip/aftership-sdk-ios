Aftership iOS SDK v1.0.0
=============

**AfterShip API SDK for iOS**

**Compatible with Afership API v4**


## Installation

The recommended approach for installing Aftership iOS SDK is via the [CocoaPods](http://cocoapods.org/).

### via CocoaPods

``` 
pod 'Aftership-iOS-SDK', '~> 1.0.0'
```

### via source code

Developer can download source code here and integrate it with your project.
Note that this project depends on [RestKit](https://github.com/RestKit/RestKit/) for network and [RXPromise](https://github.com/couchdeveloper/RXPromise) for tests. Developer have to also included them for compilation.

## Usage

Aftership iOS SDK is essentially a collection of requests to consume Aftership APIs. Before execute any request, a client must be prepared:

``` objective-c
AftershipClient *client = [AftershipClient clientWithApiKey:@"YOUR_API_KEY"];
```

and then execute requests with it:
``` objective-c
AftershipGetAllCouriersRequest *request = [AftershipGetAllCouriersRequest requestWithCompletionBlock:^(AftershipAbstractRequest *request,
          AftershipGetCouriersResponse *response,
          NSError *error) {
      if(error)
      {
        //handle failure
      } else
      {
        //handle results
      }      
  }];
[client executeRequest:request];
  
```

