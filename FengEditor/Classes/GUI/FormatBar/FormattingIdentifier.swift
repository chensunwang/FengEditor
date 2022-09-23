import Foundation

public enum FormattingIdentifier: String {
    
    case bold = "bold"
    case italic = "italic"
    case underline = "underline"
    case strikethrough = "strikethrough"
    case orderedlist = "orderedlist"
    case unorderedlist = "unorderedlist"
    case blockquote = "blockquote"
    case link = "link"
    case media = "media" //图片
    case more = "more"
    case sourcecode = "sourcecode"
    case header1 = "header1"
    case header2 = "header2"
    case header3 = "header3"
    case header4 = "header4"
    case header5 = "header5"
    case horizontalruler = "horizontalruler"
    case p = "p"
    case code = "code"
    
    case at = "at" //@用户
    case emotion = "emotion"//表情键盘
    case vedio = "vedio"//添加视频
    case style = "style"//文字样式
    case plus = "plus"//更多
   
    
    case fengTopic = "fengTopic" // 威锋话题
    case fengHashTag = "fengHashTag" // 威锋话题
    case fengVote = "fengVote" //威锋投票
    case networkDisk = "networkDisk"//网盘
   
    
}
