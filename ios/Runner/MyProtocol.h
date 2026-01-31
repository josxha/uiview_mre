#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyProtocol <NSObject>

@required
- (void)doSomething;

@optional
- (NSString *)optionalName;

@end


@protocol MyProtocol2 <NSObject>

@required
- (void)doSomething;

@optional
- (NSString *)optionalName;

@end

NS_ASSUME_NONNULL_END
