/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

//CKEDITOR.editorConfig = function(config)
//{
//	//Define changes to default configuration here. For example:
//	config.uiColor = '#90c9f1';//主题颜色
//	config.language = 'zh-cn';//中文
//};
CKEDITOR.editorConfig = function (config) {
	config.enterMode = CKEDITOR.ENTER_BR  //换行
	config.shiftEnterMode = CKEDITOR.ENTER_P; //清除默认的p标签

	config.font_names = '宋体 / 宋体; 黑体 / 黑体; 仿宋 / 仿宋_GB2312; 楷体 / 楷体_GB2312; 隶书 / 隶书; 幼圆 / 幼圆; 微软雅黑 / 微软雅黑;' + config.font_names;
	config.uiColor = '#d1edfa';//主题颜色
	config.language = 'zh-cn';//中文
	//工具栏是否可以被收缩
	config.toolbarCanCollapse = true;
	//工具栏默认是否展开
	config.toolbarStartupExpanded = true;
	config.allowedContent = true;//关闭标签过滤，
};
