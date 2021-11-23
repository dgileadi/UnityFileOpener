#import "DataConvertor.h"

@implementation DataConvertor

+(NSString *) charToNSString:(char *)value {
    if (value != NULL) {
        return [NSString stringWithUTF8String: value];
    } else {
        return nil;
    }
}

@end
