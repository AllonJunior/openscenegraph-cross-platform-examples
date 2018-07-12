FEATURE ios.h/Setup
@property (nonatomic, strong) HTTPClientProcessor *httpClientProcessor;
@property (nonatomic, strong) NSTimer *httpClientProcessorTimer;

FEATURE ios.mm/Setup
[self setupHTTPClientProcessor];

FEATURE ios.mm/SetupImpl
- (void)setupHTTPClientProcessor
{
    // TODO Pass actual HTTP client from library::.
    self.httpClientProcessor = [[HTTPClientProcessor alloc] initWithHTTPClient:0];
    // Regularly process the processor.
    self.httpClientProcessorTimer =
        [NSTimer
            scheduledTimerWithTimeInterval:0
            target:self
            selector:@selector(processHTTPClientProcessor)
            userInfo:nil
            repeats:YES
        ];
}

- (void)processHTTPClientProcessor
{
    [self.httpClientProcessor process];
}

FEATURE ios.h/Impl
@class HTTPClient;

@interface HTTPClientProcessor : NSObject

- (instancetype)initWithHTTPClient:(HTTPClient *)client;
- (void)process;

@end

FEATURE ios.mm/Impl
@interface HTTPClientProcessor ()
@property (nonatomic, strong) HTTPClient *client;
// TODO processors
@end

@implementation HTTPClientProcessor

- (instancetype)initWithHTTPClient:(HTTPClient *)client
{
    self = [super init];

    self.client = client;

    return self;
}

- (void)process
{
    // TODO
    NSLog(@"HTTPClientProcessor.process");
}

@end

/*
    // TODO Check for URL validity.
    NSURL *address = [NSURL URLWithString:url];
    NSLog(@"TODO performGetRequest. address: '%@'", address);
    NSURLSession *session = NSURLSession.sharedSession;
    // Define completion handler.
    auto handler = ^void(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"Completion handler invoked");
    };
    // Perform request.
    auto task = [session
        dataTaskWithURL:address
        completionHandler:handler];
    [task resume];
*/