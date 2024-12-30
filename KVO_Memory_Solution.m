```objectivec
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) SomeObservedObject *observedObject;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.observedObject = [[SomeObservedObject alloc] init];
    [self.observedObject addObserver:self forKeyPath:@"someProperty" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"someProperty"]) {
        // Handle changes to someProperty
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.observedObject removeObserver:self forKeyPath:@"someProperty"];
    self.observedObject = nil; // Important: Release strong reference
}

- (void) dealloc {
    [self.observedObject removeObserver:self forKeyPath:@"someProperty"]; // Added to ensure removal in dealloc
}

@end

```