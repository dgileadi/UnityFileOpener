#import "OpenInPlace.h"

static OpenInPlace *openInPlace;

@implementation OpenInPlace

UIDocumentInteractionController* dic = nil;

- (BOOL) openInPlace:(NSString *)url uti:(NSString *)uti {
    dic = [UIDocumentInteractionController interactionControllerWithURL:[NSURL URLWithString:url]];
    dic.delegate = self;
    if (uti != nil)
        dic.UTI = uti;
    return [dic presentOpenInMenuFromRect:CGRectZero inView:UnityGetGLView() animated:YES];
}

- (void)documentInteractionController:(UIDocumentInteractionController *)controller
        willBeginSendingToApplication:(NSString *)application {
    [dic dismissMenuAnimated:NO];
    [dic dismissMenuAnimated:NO];
}

+(NSString *) charToNSString:(char *)value {
    if (value != NULL) {
        return [NSString stringWithUTF8String: value];
    } else {
        return nil;
    }
}

extern "C" {
    void UFO_OpenInPlace(char* url, char* uti) {
        openInPlace = [[OpenInPlace alloc] init];
        [openInPlace openInPlace:[OpenInPlace charToNSString:url] uti:[OpenInPlace charToNSString:uti]];
    }
}

@end
