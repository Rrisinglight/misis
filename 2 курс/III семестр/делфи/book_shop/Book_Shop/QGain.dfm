�
 TFORM_QGAIN 0�	  TPF0TForm_QGain
Form_QGainLeft� TopzWidth�Height*Caption   Выручка - ЗапросColor	clBtnFaceConstraints.MinHeight� Constraints.MinWidth�Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� �� ��    ��w|���  ��    ��ww����� �������w|����  ������ww��� ����    ��|�w   ��    ��ww�w    ��  ��wwww� �  ��  ��ww|w|� �  �����ww�w����� �����w|�|�������������������������������� ���������w�w � ���  ���w�w �  ��    ��ww�w �  ���  �|ww�w �  ���  �|ww�w �  ��    ��ww�w � ���  ���w�w � ���������w�w��������������������������������� �����w|�|�� �  �����ww�w�� �  ��  ��ww|w|    ��  ��wwww   ��    ��ww�w ����    ��|�w��  ������ww������ �������w|����  ��    ��ww���� ��    ��w|�                                                                                                                                OldCreateOrderPixelsPerInchx
TextHeight TLabelLabel1LeftTop� WidthoHeightCaption   Начальная дата  TLabelLabel2LeftTop� WidtheHeightCaption   Конечная дата  TDBGridDBGrid1Left Top Width�Height� AlignalTopAnchorsakBottom 
DataSourceDataSource1TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TButtonButton_CloseLeftXTop� WidthaHeightCaption   0:@KBLTabOrderOnClickButton_CloseClick  TButtonButton_ExecuteLeft�Top� WidthiHeightCaption	   K?>;=8BLTabOrderOnClickButton_ExecuteClick  TDateTimePickerDateTimePicker_StartLeft~Top� Width� HeightDate �i|%���@Time �i|%���@TabOrder  TDateTimePickerDateTimePicker_LastLeftvTop� Width� HeightDate �i|%���@Time �i|%���@TabOrder  TQueryQuery1SQL.Strings5SELECT w.name, SUM((s.cost-b.cost)*s.amount) AS gain +FROM warhouses AS w, sales AS s, books AS b@WHERE s.sale_date>= :first_date and s.sale_date<= :last_date and%w.id=s.id_warhouse and s.id_book=b.idGROUP BY w.name Left� TopP	ParamDataDataTypeftDateName
first_date	ParamType	ptUnknown DataTypeftDateName	last_date	ParamType	ptUnknown    TDataSourceDataSource1DataSetQuery1Left� TopP   