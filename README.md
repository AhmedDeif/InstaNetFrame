# InstaNetFrame

InstaNetFrame is a networking IOS framework for executing HTTP requests in apps. It has the following features:

- Support for enqueuing requests and executing them in a FIFO order.
- Enqueuing a request should accept a URL, an HTTP verb, and a set parameters.
- Requests should be executed in the background while maintaining thread-safety.
- Once a request is done, the enqueuer should be notified and the response object should be passed to it.
- Requests should continue to run when app goes to the background.
- Requests should run concurrently based on network condition. If device is on cellular connection, number of concurrent requests should be restricted to 2, while Wi-Fi should execute up to 6 simultaneous requests.
- Extends UIImageView as InstaNetUIImageView. InstaNetUIImageView loads an image using a URL displaying an activity indicator until the image is loaded.


The code block below shows how to send a GET request to URL "http://localhost:3000/posts/7" and 
print the JSON response from server:
```
@import InstaNetFrame;


APIRequestManager *manager = [APIRequestManager sharedAPIRequestManager];

NSString *str = [NSString stringWithFormat:@"http://localhost:3000/posts/%d", 7];
Request *myRequest =  [[Request alloc] initWithURL:[NSURL URLWithString: str] MethodType:GET RequestParameters:nil onComplete:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            //  jsonResponse can be used to update UI or create data models.            
            NSLog(@"%@",jsonResponse);
        }];
        
[manager enqueueRequest:myRequest];
[manager dequeueRequest];
```


The code block below shows how to use InstaNetUIImageView:
```
@import InstaNetFrame;

@interface myViewController ()

//  outlet to InstaNetUIImageView in storyboard. 
//  **Note:** The class of ImageView must be set to InstaNetUIImageView.
@property (weak, nonatomic) IBOutlet InstaNetUIImageView *myImage;

@end

@implementation myViewController

- (void) methodName {
            APIRequestManager *manager = [APIRequestManager sharedAPIRequestManager];
            Request* request = [[Request alloc] initWithURL:[NSURL URLWithString:@"https://images.unsplash.com/photo-1476445704028-a36e0c798192"] MethodType:GET];
            [_myImage initWithImageRequest:request withInstaNetUIImageView:_myImage ApiManager:manager];
}

@end
```



