# YMDateTimeChooseView
一个用于时间日期选择的view,可自定义要显示的行数和内容

![image](https://github.com/Barry-Wang/YMDateTimeChooseView/blob/master/datePicker.gif)

效果如上面所示。一个可自定义行数的时间选择器。

# How to use

```python

    self.timeView = [[YMTimeChooseView alloc] initWithFrame:CGRectMake(40, 150, 320, 300) dataPickerHeight:150      timeNames:@[@"开始时间",@"中间时间",@"结束时间",@"开始时间",@"中间时间",@"结束时间"]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyy-MM";
    
    self.timeView.dateFormatter = formatter;
    

   [self.view addSubview:self.timeView];

```
使用 - (instancetype)initWithFrame:(CGRect)frame dataPickerHeight:(CGFloat)height timeNames:(NSArray *)timeNames 来创建一个YMTimeChooseView， height 是点击后DatePickerView的高度， timeNames保存要显示的每行的名称，timeNames 元素的个数决定了要显示的行数。未点击时显示的高度的是 frame.size.height / timeNames.count.

```python
@property (nonatomic, assign) CGFloat dataPickerHeight;       // 要显示 datePickerView 的高度

@property (nonatomic, strong) NSMutableArray *timeViewsArray;   

@property (nonatomic, strong) NSDateFormatter *dateFormatter; // 显示的时间的格式

```
timeViewArray 保存的对象是 YMTimeView类型的, 显示的每一行都是一个YMTimeView对象,显示的顺序就是保存的顺序。
通过YMTimeView 的nameLabel属性可以获得当前YMTimeVie显示名称的label, titleLabel属相获得当前YMTimeVie显示时间的label。

