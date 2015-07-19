/*
Navicat SQL Server Data Transfer

Source Server         : 192.168.1.124
Source Server Version : 100000
Source Host           : 192.168.1.124:1433
Source Database       : CUNITSystem
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 100000
File Encoding         : 65001

Date: 2014-02-25 11:32:12
*/


-- ----------------------------
-- Table structure for [T_CB_ENROL]
-- ----------------------------
DROP TABLE [T_CB_ENROL]
GO
CREATE TABLE [T_CB_ENROL] (
[enrolId] int NOT NULL IDENTITY(1,1) ,
[fkId] int NULL ,
[nwId] int NULL ,
[createTime] datetime NULL ,
[type] int NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_ENROL]', RESEED, 7)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_CB_ENROL', 
'COLUMN', N'fkId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'关联的学生或者老师ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_ENROL'
, @level2type = 'COLUMN', @level2name = N'fkId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'关联的学生或者老师ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_ENROL'
, @level2type = 'COLUMN', @level2name = N'fkId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_CB_ENROL', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1 学生
   2 老师'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_ENROL'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1 学生
   2 老师'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_ENROL'
, @level2type = 'COLUMN', @level2name = N'type'
GO

-- ----------------------------
-- Records of T_CB_ENROL
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_ENROL] ON
GO
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'1', N'2', N'4', N'2014-02-13 17:13:33.653', N'1');
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'2', N'3', N'4', N'2014-02-17 09:10:32.607', N'2');
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'3', N'2', N'5', N'2014-02-17 10:02:16.887', N'1');
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'4', N'2', N'6', N'2014-02-17 11:42:13.230', N'1');
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'5', N'5', N'4', N'2014-02-20 14:35:06.840', N'1');
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'6', N'6', N'4', N'2014-02-21 09:56:12.857', N'1');
INSERT INTO [T_CB_ENROL] ([enrolId], [fkId], [nwId], [createTime], [type]) VALUES (N'7', N'5', N'5', N'2014-02-24 16:26:28.607', N'1');
GO
SET IDENTITY_INSERT [T_CB_ENROL] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_EXAM]
-- ----------------------------
DROP TABLE [T_CB_EXAM]
GO
CREATE TABLE [T_CB_EXAM] (
[examId] int NOT NULL IDENTITY(1,1) ,
[examName] varchar(500) NULL ,
[nwId] int NULL ,
[endDate] date NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_EXAM]', RESEED, 11)
GO

-- ----------------------------
-- Records of T_CB_EXAM
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_EXAM] ON
GO
INSERT INTO [T_CB_EXAM] ([examId], [examName], [nwId], [endDate]) VALUES (N'10', N'第一次', N'5', N'2014-02-24');
INSERT INTO [T_CB_EXAM] ([examId], [examName], [nwId], [endDate]) VALUES (N'11', N'sdf', N'5', N'2014-02-27');
GO
SET IDENTITY_INSERT [T_CB_EXAM] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_EXAM_QUESTION]
-- ----------------------------
DROP TABLE [T_CB_EXAM_QUESTION]
GO
CREATE TABLE [T_CB_EXAM_QUESTION] (
[eqId] int NOT NULL IDENTITY(1,1) ,
[examId] int NULL ,
[nwId] int NULL ,
[questionId] int NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_EXAM_QUESTION]', RESEED, 14)
GO

-- ----------------------------
-- Records of T_CB_EXAM_QUESTION
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_EXAM_QUESTION] ON
GO
INSERT INTO [T_CB_EXAM_QUESTION] ([eqId], [examId], [nwId], [questionId]) VALUES (N'13', N'10', N'5', N'29');
INSERT INTO [T_CB_EXAM_QUESTION] ([eqId], [examId], [nwId], [questionId]) VALUES (N'14', N'10', N'5', N'28');
GO
SET IDENTITY_INSERT [T_CB_EXAM_QUESTION] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_GRADE]
-- ----------------------------
DROP TABLE [T_CB_GRADE]
GO
CREATE TABLE [T_CB_GRADE] (
[gradeId] int NOT NULL IDENTITY(1,1) ,
[GradeName] varchar(100) NULL ,
[createTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_GRADE]', RESEED, 5)
GO

-- ----------------------------
-- Records of T_CB_GRADE
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_GRADE] ON
GO
INSERT INTO [T_CB_GRADE] ([gradeId], [GradeName], [createTime]) VALUES (N'1', N'大学1年级', N'2014-01-21 11:47:27.000');
INSERT INTO [T_CB_GRADE] ([gradeId], [GradeName], [createTime]) VALUES (N'2', N'大学2年级', N'2014-01-21 11:47:30.000');
INSERT INTO [T_CB_GRADE] ([gradeId], [GradeName], [createTime]) VALUES (N'3', N'大学3年级', N'2014-01-21 11:47:32.000');
INSERT INTO [T_CB_GRADE] ([gradeId], [GradeName], [createTime]) VALUES (N'4', N'大学4年级', N'2014-01-21 11:47:35.000');
INSERT INTO [T_CB_GRADE] ([gradeId], [GradeName], [createTime]) VALUES (N'5', N'大学5年级', N'2014-01-21 11:47:37.000');
GO
SET IDENTITY_INSERT [T_CB_GRADE] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_HOMEWORK]
-- ----------------------------
DROP TABLE [T_CB_HOMEWORK]
GO
CREATE TABLE [T_CB_HOMEWORK] (
[hwId] int NOT NULL IDENTITY(1,1) ,
[questionIdArr] varchar(5000) NULL ,
[lastTime] datetime NULL ,
[nwId] int NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_HOMEWORK]', RESEED, 8)
GO

-- ----------------------------
-- Records of T_CB_HOMEWORK
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_HOMEWORK] ON
GO
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'1', N'19,14', N'2014-02-19 15:00:13.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'2', N'18,15', N'2014-02-19 15:00:49.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'3', N'18,15', N'2014-02-19 15:01:18.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'4', N'17,16', N'2014-02-21 15:02:29.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'5', N'20,21,25', N'2014-02-21 15:21:41.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'6', N'20,18', N'2014-02-21 15:22:27.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'7', N'21,17,14', N'2014-02-21 16:04:36.000', N'4');
INSERT INTO [T_CB_HOMEWORK] ([hwId], [questionIdArr], [lastTime], [nwId]) VALUES (N'8', N'16,17', N'2014-02-21 17:09:05.000', N'4');
GO
SET IDENTITY_INSERT [T_CB_HOMEWORK] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_HOMEWORK_COMMENTS]
-- ----------------------------
DROP TABLE [T_CB_HOMEWORK_COMMENTS]
GO
CREATE TABLE [T_CB_HOMEWORK_COMMENTS] (
[hwcId] int NOT NULL IDENTITY(1,1) ,
[nwId] int NULL ,
[stuId] int NULL ,
[isEligible] int NULL ,
[date] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_HOMEWORK_COMMENTS]', RESEED, 8)
GO

-- ----------------------------
-- Records of T_CB_HOMEWORK_COMMENTS
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_HOMEWORK_COMMENTS] ON
GO
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'1', N'4', N'2', N'1', N'2014-02-20 16:12:36.247');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'2', N'4', N'5', N'1', N'2014-02-20 16:13:30.687');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'3', N'4', N'5', N'1', N'2014-02-20 16:13:55.437');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'4', N'4', N'2', N'1', N'2014-02-20 16:15:07.653');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'5', N'4', N'5', N'2', N'2014-02-20 16:15:13.513');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'6', N'4', N'5', N'2', N'2014-02-20 16:17:56.733');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'7', N'4', N'5', N'2', N'2014-02-21 09:51:57.107');
INSERT INTO [T_CB_HOMEWORK_COMMENTS] ([hwcId], [nwId], [stuId], [isEligible], [date]) VALUES (N'8', N'4', N'2', N'1', N'2014-02-21 09:52:25.747');
GO
SET IDENTITY_INSERT [T_CB_HOMEWORK_COMMENTS] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_HOMEWORK_LOG]
-- ----------------------------
DROP TABLE [T_CB_HOMEWORK_LOG]
GO
CREATE TABLE [T_CB_HOMEWORK_LOG] (
[hwLogId] int NOT NULL IDENTITY(1,1) ,
[stuId] int NULL ,
[subTime] datetime NULL ,
[nwId] int NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_HOMEWORK_LOG]', RESEED, 4)
GO

-- ----------------------------
-- Records of T_CB_HOMEWORK_LOG
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_HOMEWORK_LOG] ON
GO
INSERT INTO [T_CB_HOMEWORK_LOG] ([hwLogId], [stuId], [subTime], [nwId]) VALUES (N'1', N'2', N'2014-02-19 14:12:28.770', N'4');
INSERT INTO [T_CB_HOMEWORK_LOG] ([hwLogId], [stuId], [subTime], [nwId]) VALUES (N'2', N'2', N'2014-02-19 16:05:10.170', N'4');
INSERT INTO [T_CB_HOMEWORK_LOG] ([hwLogId], [stuId], [subTime], [nwId]) VALUES (N'3', N'2', N'2014-02-19 16:05:38.297', N'4');
INSERT INTO [T_CB_HOMEWORK_LOG] ([hwLogId], [stuId], [subTime], [nwId]) VALUES (N'4', N'2', N'2014-02-19 17:09:54.390', N'4');
GO
SET IDENTITY_INSERT [T_CB_HOMEWORK_LOG] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_MENUS]
-- ----------------------------
DROP TABLE [T_CB_MENUS]
GO
CREATE TABLE [T_CB_MENUS] (
[MenuId] int NOT NULL IDENTITY(1,1) ,
[ParentMenuId] int NOT NULL ,
[MenuName] varchar(50) NOT NULL ,
[CreateTime] datetime NOT NULL ,
[MenuURL] varchar(100) NULL ,
[OrderNum] int NULL ,
[MenuType] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_MENUS]', RESEED, 52)
GO

-- ----------------------------
-- Records of T_CB_MENUS
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_MENUS] ON
GO
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'1', N'0', N'我的课程', N'2014-01-06 14:37:32.000', null, null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'2', N'0', N'我的资源', N'2014-01-06 14:37:56.000', null, null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'3', N'0', N'网络课程', N'2014-01-06 15:53:54.000', N'', null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'4', N'1', N'我的课程列表', N'2014-01-06 15:55:10.000', N'/client/enrolList.jsp', null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'5', N'3', N'课程列表', N'2014-01-06 16:18:44.000', N'/manager/netWorkCourseList.jsp', null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'6', N'0', N'资源管理', N'2014-01-06 17:52:50.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'7', N'0', N'学生管理', N'2014-01-06 17:53:24.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'13', N'6', N'资源列表', N'2014-01-06 17:56:16.000', N'/manager/resourceList.jsp', null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'14', N'0', N'网络课程', N'2014-01-06 17:56:34.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'15', N'0', N'教师管理', N'2014-01-06 17:58:00.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'16', N'0', N'题库管理', N'2014-01-06 17:58:16.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'17', N'0', N'推荐管理', N'2014-01-06 17:58:39.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'21', N'17', N'推荐列表', N'2014-01-06 18:01:21.000', N'/manager/recommendList.jsp', null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'22', N'16', N'试题列表', N'2014-01-06 18:02:08.000', N'/manager/questionList.jsp', null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'23', N'15', N'教师列表', N'2014-01-06 18:02:32.000', N'/manager/teacherList.jsp', null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'25', N'7', N'学生列表', N'2014-01-06 18:03:34.000', N'/manager/studentList.jsp', null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'29', N'2', N'资源列表', N'2014-01-07 11:02:18.000', N'/manager/resourceList.jsp', null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'31', N'0', N'在线求助', N'2014-01-07 11:09:42.000', null, null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'33', N'31', N'求助老师', N'2014-01-07 11:13:41.000', N'/client/helpTeacher.jsp', null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'34', N'31', N'讨论组', N'2014-01-07 11:15:12.000', N'/client/discussion.jsp', null, N'2');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'35', N'0', N'我的课程', N'2014-01-06 14:37:32.000', N'', null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'36', N'0', N'我的资源', N'2014-01-06 14:37:32.000', N'', null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'38', N'49', N'回答问题', N'2014-01-06 14:37:32.000', N'/client/question.jsp', null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'40', N'35', N'我的课程列表', N'2014-01-06 14:37:32.000', N'/client/enrolList.jsp', null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'41', N'36', N'推荐列表', N'2014-01-06 14:37:32.000', N'/manager/recommendList.jsp', null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'46', N'14', N'课程列表', N'2014-02-07 16:11:45.000', N'/manager/netWorkCourseList.jsp', null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'47', N'0', N'网络课程', N'2014-02-06 14:37:32.000', null, null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'49', N'0', N'在线解答', N'2014-02-06 14:37:32.000', null, null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'50', N'47', N'课程列表', N'2014-02-10 10:29:10.000', N'/manager/netWorkCourseList.jsp', null, N'3');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'51', N'0', N'考试管理', N'2014-01-06 17:58:17.000', null, null, N'1');
INSERT INTO [T_CB_MENUS] ([MenuId], [ParentMenuId], [MenuName], [CreateTime], [MenuURL], [OrderNum], [MenuType]) VALUES (N'52', N'51', N'考试列表', N'2014-02-18 17:09:48.000', N'/manager/examList.jsp', null, N'1');
GO
SET IDENTITY_INSERT [T_CB_MENUS] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_NETWORKCOURSE]
-- ----------------------------
DROP TABLE [T_CB_NETWORKCOURSE]
GO
CREATE TABLE [T_CB_NETWORKCOURSE] (
[nwId] int NOT NULL IDENTITY(1,1) ,
[CourseName] varchar(100) NULL ,
[gradeId] int NULL ,
[createTime] datetime NULL ,
[description] char(10) NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_NETWORKCOURSE]', RESEED, 6)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_CB_NETWORKCOURSE', 
'COLUMN', N'gradeId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1 音频视频 
   2 教学素材
   3 教学课件
   4 教学文献'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_NETWORKCOURSE'
, @level2type = 'COLUMN', @level2name = N'gradeId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1 音频视频 
   2 教学素材
   3 教学课件
   4 教学文献'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_NETWORKCOURSE'
, @level2type = 'COLUMN', @level2name = N'gradeId'
GO

-- ----------------------------
-- Records of T_CB_NETWORKCOURSE
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_NETWORKCOURSE] ON
GO
INSERT INTO [T_CB_NETWORKCOURSE] ([nwId], [CourseName], [gradeId], [createTime], [description]) VALUES (N'4', N'大学英语1', null, N'2014-02-10 10:09:21.187', N'大学英语1 ');
INSERT INTO [T_CB_NETWORKCOURSE] ([nwId], [CourseName], [gradeId], [createTime], [description]) VALUES (N'5', N'大学数学1', null, N'2014-02-10 10:09:27.280', N'大学数学1 ');
INSERT INTO [T_CB_NETWORKCOURSE] ([nwId], [CourseName], [gradeId], [createTime], [description]) VALUES (N'6', N'大学语文1', null, N'2014-02-10 10:09:32.373', N'大学语文1 ');
GO
SET IDENTITY_INSERT [T_CB_NETWORKCOURSE] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_OPTIONS]
-- ----------------------------
DROP TABLE [T_CB_OPTIONS]
GO
CREATE TABLE [T_CB_OPTIONS] (
[optionId] int NOT NULL IDENTITY(1,1) ,
[oName] varchar(10) NULL ,
[content] varchar(100) NULL ,
[questionId] int NULL ,
[Correct] int NULL ,
[createTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_OPTIONS]', RESEED, 30)
GO

-- ----------------------------
-- Records of T_CB_OPTIONS
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_OPTIONS] ON
GO
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'1', N'A', N'231', N'10', N'2', N'2014-02-17 13:49:42.560');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'2', N'B', N'tte', N'10', N'1', N'2014-02-17 13:55:09.513');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'3', N'C', N'wer', N'10', N'2', N'2014-02-17 13:56:13.387');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'4', N'D', N'trt', N'10', N'2', N'2014-02-17 13:56:22.277');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'5', N'A', N'a', N'12', N'2', N'2014-02-17 15:18:35.950');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'6', N'B', N'df', N'12', N'2', N'2014-02-17 15:18:44.840');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'7', N'C', N'r', N'12', N'1', N'2014-02-17 15:18:51.560');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'8', N'D', N's', N'12', N'2', N'2014-02-17 15:19:00.777');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'9', N'A', N'ewq', N'11', N'2', N'2014-02-17 15:19:15.900');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'10', N'B', N'ff', N'11', N'2', N'2014-02-17 15:19:22.870');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'11', N'C', N'trt', N'11', N'2', N'2014-02-17 15:19:28.497');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'12', N'D', N'tgh', N'11', N'1', N'2014-02-17 15:19:35.730');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'13', N'A', N'34', N'21', N'2', N'2014-02-18 16:41:11.840');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'14', N'B', N'234', N'21', N'1', N'2014-02-18 16:41:24.343');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'15', N'A', N'选项1', N'16', N'2', N'2014-02-24 11:06:20.183');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'16', N'B', N'选项2', N'16', N'2', N'2014-02-24 11:06:32.000');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'17', N'C', N'选项3', N'16', N'1', N'2014-02-24 11:06:41.810');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'18', N'D', N'选项4', N'16', N'2', N'2014-02-24 11:06:53.640');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'19', N'A', N'选项1', N'17', N'2', N'2014-02-24 11:07:19.480');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'20', N'B', N'选项2', N'17', N'1', N'2014-02-24 11:07:31.937');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'21', N'C', N'选项3', N'17', N'2', N'2014-02-24 11:07:39.153');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'22', N'D', N'选项4', N'17', N'2', N'2014-02-24 11:07:45.450');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'23', N'A', N'1', N'29', N'2', N'2014-02-24 13:31:19.967');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'24', N'B', N'2', N'29', N'2', N'2014-02-24 13:31:33.670');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'25', N'C', N'3', N'29', N'2', N'2014-02-24 13:31:38.873');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'26', N'D', N'4', N'29', N'1', N'2014-02-24 13:31:50.200');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'27', N'A', N'3', N'28', N'1', N'2014-02-24 13:35:43.280');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'28', N'B', N'4', N'28', N'2', N'2014-02-24 13:35:49.683');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'29', N'C', N'5', N'28', N'2', N'2014-02-24 13:35:56.217');
INSERT INTO [T_CB_OPTIONS] ([optionId], [oName], [content], [questionId], [Correct], [createTime]) VALUES (N'30', N'D', N'6', N'28', N'2', N'2014-02-24 13:36:02.263');
GO
SET IDENTITY_INSERT [T_CB_OPTIONS] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_QUESTIONS]
-- ----------------------------
DROP TABLE [T_CB_QUESTIONS]
GO
CREATE TABLE [T_CB_QUESTIONS] (
[questionID] int NOT NULL IDENTITY(1,1) ,
[content] varchar(5000) NULL ,
[nwId] int NULL ,
[Score] int NULL ,
[createTime] datetime NULL ,
[title] varchar(1000) NULL ,
[description] varchar(5000) NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_QUESTIONS]', RESEED, 29)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_CB_QUESTIONS', 
'COLUMN', N'nwId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1 音频视频 
   2 教学素材
   3 教学课件
   4 教学文献'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_QUESTIONS'
, @level2type = 'COLUMN', @level2name = N'nwId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1 音频视频 
   2 教学素材
   3 教学课件
   4 教学文献'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_QUESTIONS'
, @level2type = 'COLUMN', @level2name = N'nwId'
GO

-- ----------------------------
-- Records of T_CB_QUESTIONS
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_QUESTIONS] ON
GO
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'6', N'123', N'4', N'1', N'2014-02-13 15:53:14.763', N'题目18', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'10', N'34vb', N'6', N'2', N'2014-02-13 15:55:54.513', N'题目17', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'12', N'hello?', N'6', N'2', N'2014-02-17 15:17:59.600', N'题目16', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'13', N'大学英语题目1', N'4', N'1', N'2014-02-18 10:59:48.450', N'题目15', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'14', N'大学英语题目2', N'4', N'2', N'2014-02-18 10:59:57.717', N'题目10', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'15', N'大学英语题目3', N'4', N'3', N'2014-02-18 11:00:08.373', N'题目9', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'16', N'大学英语题目4', N'4', N'4', N'2014-02-18 11:00:16.293', N'题目8', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'17', N'大学英语题目5', N'4', N'5', N'2014-02-18 11:00:24.890', N'题目6', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'18', N'大学英语题目6', N'4', N'6', N'2014-02-18 11:00:35.483', N'题目7', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'19', N'大学英语题目7', N'4', N'7', N'2014-02-18 11:00:44.200', N'题目5', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'20', N'大学英语题目8', N'4', N'8', N'2014-02-18 11:01:04.843', N'题目4', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'21', N'大学英语题目9', N'4', N'9', N'2014-02-18 11:01:17.357', N'题目3', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'22', N'大学英语题目10', N'4', N'1', N'2014-02-18 11:01:46.857', N'题目14', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'23', N'大学英语题目11', N'4', N'2', N'2014-02-18 11:02:22.793', N'题目13', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'24', N'大学英语题目12', N'4', N'2', N'2014-02-18 11:02:29.483', N'题目12', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'25', N'大学英语题目13', N'4', N'2', N'2014-02-18 11:02:39.390', N'题目11', null);
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'28', N'1+1=2？', N'5', N'1', N'2014-02-24 13:29:03.717', null, N'');
INSERT INTO [T_CB_QUESTIONS] ([questionID], [content], [nwId], [Score], [createTime], [title], [description]) VALUES (N'29', N'1+2=3？', N'5', N'2', N'2014-02-24 13:30:45.373', null, N'');
GO
SET IDENTITY_INSERT [T_CB_QUESTIONS] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_RECOMMEND]
-- ----------------------------
DROP TABLE [T_CB_RECOMMEND]
GO
CREATE TABLE [T_CB_RECOMMEND] (
[recId] int NOT NULL IDENTITY(1,1) ,
[content] varchar(1000) NULL ,
[recType] int NULL ,
[path] varchar(500) NULL ,
[createTime] datetime NULL ,
[updateTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_RECOMMEND]', RESEED, 6)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_CB_RECOMMEND', 
'COLUMN', N'recType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1 教学材料
   2 教学课程
   3 教学方法
   4 教学目标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_RECOMMEND'
, @level2type = 'COLUMN', @level2name = N'recType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1 教学材料
   2 教学课程
   3 教学方法
   4 教学目标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_RECOMMEND'
, @level2type = 'COLUMN', @level2name = N'recType'
GO

-- ----------------------------
-- Records of T_CB_RECOMMEND
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_RECOMMEND] ON
GO
INSERT INTO [T_CB_RECOMMEND] ([recId], [content], [recType], [path], [createTime], [updateTime]) VALUES (N'5', N'1.早上起来读书<br/>
2.晚上睡觉前回顾下学习内容', N'3', N'404error.jpg', N'2014-02-07 15:17:21.670', N'2014-02-13 11:02:44.263');
INSERT INTO [T_CB_RECOMMEND] ([recId], [content], [recType], [path], [createTime], [updateTime]) VALUES (N'6', N'大学的英语ppt (1-3)', N'1', null, N'2014-02-07 15:27:51.200', N'2014-02-07 15:30:19.920');
GO
SET IDENTITY_INSERT [T_CB_RECOMMEND] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_RESOURCE]
-- ----------------------------
DROP TABLE [T_CB_RESOURCE]
GO
CREATE TABLE [T_CB_RESOURCE] (
[resourceID] int NOT NULL IDENTITY(1,1) ,
[resourceName] varchar(200) NULL ,
[resourcePath] varchar(1000) NULL ,
[resourceType] int NULL ,
[createTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_RESOURCE]', RESEED, 46)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'T_CB_RESOURCE', 
'COLUMN', N'resourceType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1 音频视频 
   2 教学素材
   3 教学课件
   4 教学文献'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_RESOURCE'
, @level2type = 'COLUMN', @level2name = N'resourceType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1 音频视频 
   2 教学素材
   3 教学课件
   4 教学文献'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'T_CB_RESOURCE'
, @level2type = 'COLUMN', @level2name = N'resourceType'
GO

-- ----------------------------
-- Records of T_CB_RESOURCE
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_RESOURCE] ON
GO
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'1', N'大学语文', N'c:/大学语文.avi', N'1', N'2014-01-15 14:04:30.000');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'2', N'sdf', N'dnf.txt', N'1', N'2014-01-15 17:43:18.930');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'3', N'asdf', N'dnf.txt', N'1', N'2014-01-15 17:44:51.653');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'4', N'fvgcfbvc', N'dnf.txt', N'1', N'2014-01-15 17:47:48.200');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'8', N'sdfa', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 11:20:19.653');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'9', N'sdfa', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 11:21:12.770');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'10', N'fgfhghg', N'c8177f3e6709c93de82f1e869e3df8dcd00054e5.gif', N'1', N'2014-01-16 11:22:16.340');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'11', N'sdafffcv', N'c8177f3e6709c93de82f1e869e3df8dcd00054e5.gif', N'1', N'2014-01-16 11:22:53.250');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'12', N'vxcbvnb', N'main_10.JPG', N'1', N'2014-01-16 11:32:49.187');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'13', N'sdfsdfcvb v ', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 11:46:25.670');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'14', N'sdfacvcb', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 11:47:26.300');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'15', N'vbnblp', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 11:47:53.483');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'16', N'uyoim', N'c8177f3e6709c93de82f1e869e3df8dcd00054e5.gif', N'1', N'2014-01-16 11:49:08.437');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'17', N'234brtyuqwq', N'myeclipse配置.txt', N'1', N'2014-01-16 11:51:09.937');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'18', N'b768678', N'c8177f3e6709c93de82f1e869e3df8dcd00054e5.gif', N'1', N'2014-01-16 11:59:03.250');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'19', N'123s455523', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 12:00:20.530');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'20', N'575', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 13:38:23.903');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'22', N'5644', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 13:40:15.263');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'23', N'8768678', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 13:45:46.530');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'24', N'sdfa', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 14:22:11.187');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'27', N'2355', N'codetemplates_CloudReal_v1.0.xml', N'1', N'2014-01-16 14:27:43.640');
INSERT INTO [T_CB_RESOURCE] ([resourceID], [resourceName], [resourcePath], [resourceType], [createTime]) VALUES (N'32', N'2', N'404error.gif', N'1', N'2014-01-16 14:43:59.340');
GO
SET IDENTITY_INSERT [T_CB_RESOURCE] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_STU_EXAM]
-- ----------------------------
DROP TABLE [T_CB_STU_EXAM]
GO
CREATE TABLE [T_CB_STU_EXAM] (
[stu_examId] int NOT NULL IDENTITY(1,1) ,
[stuId] int NULL ,
[optionId] int NULL ,
[nwId] int NULL ,
[examId] int NULL ,
[score] int NULL DEFAULT ((0)) 
)


GO
DBCC CHECKIDENT(N'[T_CB_STU_EXAM]', RESEED, 11)
GO

-- ----------------------------
-- Records of T_CB_STU_EXAM
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_STU_EXAM] ON
GO
INSERT INTO [T_CB_STU_EXAM] ([stu_examId], [stuId], [optionId], [nwId], [examId], [score]) VALUES (N'10', N'2', N'27', N'5', N'10', N'1');
INSERT INTO [T_CB_STU_EXAM] ([stu_examId], [stuId], [optionId], [nwId], [examId], [score]) VALUES (N'11', N'2', N'25', N'5', N'10', N'0');
GO
SET IDENTITY_INSERT [T_CB_STU_EXAM] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_STU_HOMEWORK]
-- ----------------------------
DROP TABLE [T_CB_STU_HOMEWORK]
GO
CREATE TABLE [T_CB_STU_HOMEWORK] (
[stu_hwId] int NOT NULL IDENTITY(1,1) ,
[stuId] int NULL ,
[optionId] int NULL ,
[nwId] int NULL ,
[i] int NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_STU_HOMEWORK]', RESEED, 26)
GO

-- ----------------------------
-- Records of T_CB_STU_HOMEWORK
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_STU_HOMEWORK] ON
GO
SET IDENTITY_INSERT [T_CB_STU_HOMEWORK] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_STUDENT]
-- ----------------------------
DROP TABLE [T_CB_STUDENT]
GO
CREATE TABLE [T_CB_STUDENT] (
[sid] int NOT NULL IDENTITY(1,1) ,
[sName] varchar(50) NULL ,
[sex] char(1) NULL ,
[age] int NULL ,
[email] varchar(100) NULL ,
[phone] char(11) NULL ,
[address] varchar(1000) NULL ,
[sNo] char(18) NULL ,
[createTime] datetime NULL ,
[gradeId] int NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_STUDENT]', RESEED, 16)
GO

-- ----------------------------
-- Records of T_CB_STUDENT
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_STUDENT] ON
GO
INSERT INTO [T_CB_STUDENT] ([sid], [sName], [sex], [age], [email], [phone], [address], [sNo], [createTime], [gradeId]) VALUES (N'6', N'张三', N'1', N'21', N'zhangsan@163.com', N'15651888080', N'中国北京', N'12345             ', N'2014-01-21 11:50:38.000', N'1');
INSERT INTO [T_CB_STUDENT] ([sid], [sName], [sex], [age], [email], [phone], [address], [sNo], [createTime], [gradeId]) VALUES (N'15', N'杰克', N'1', N'23', N'jack@163.com', N'12346578912', N'美国纽约', N'123456789123456789', N'2014-02-11 17:16:28.000', N'1');
INSERT INTO [T_CB_STUDENT] ([sid], [sName], [sex], [age], [email], [phone], [address], [sNo], [createTime], [gradeId]) VALUES (N'16', N'test1', N'1', N'23', N'test1@163.com', N'12345678912', N'sddsd', N'320811199008084444', N'2014-02-21 09:55:26.900', N'1');
GO
SET IDENTITY_INSERT [T_CB_STUDENT] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_SUBJECT]
-- ----------------------------
DROP TABLE [T_CB_SUBJECT]
GO
CREATE TABLE [T_CB_SUBJECT] (
[subjectId] int NOT NULL IDENTITY(1,1) ,
[subjectName] varchar(100) NULL ,
[subjectType] char(3) NULL ,
[createTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_SUBJECT]', RESEED, 8)
GO

-- ----------------------------
-- Records of T_CB_SUBJECT
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_SUBJECT] ON
GO
INSERT INTO [T_CB_SUBJECT] ([subjectId], [subjectName], [subjectType], [createTime]) VALUES (N'6', N'456', null, N'2014-01-24 12:35:06.500');
GO
SET IDENTITY_INSERT [T_CB_SUBJECT] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_TEACHER]
-- ----------------------------
DROP TABLE [T_CB_TEACHER]
GO
CREATE TABLE [T_CB_TEACHER] (
[tId] int NOT NULL IDENTITY(1,1) ,
[tName] varchar(50) NULL ,
[sex] char(1) NULL ,
[teachingAge] int NULL ,
[tNo] char(18) NULL ,
[phone] char(11) NULL ,
[email] varchar(100) NULL ,
[address] varchar(1000) NULL ,
[createTime] datetime NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_TEACHER]', RESEED, 8)
GO

-- ----------------------------
-- Records of T_CB_TEACHER
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_TEACHER] ON
GO
INSERT INTO [T_CB_TEACHER] ([tId], [tName], [sex], [teachingAge], [tNo], [phone], [email], [address], [createTime]) VALUES (N'4', N'王五', N'1', N'4', N'1                 ', N'111        ', N'23@16.com', N'11', N'2014-01-22 14:31:14.873');
INSERT INTO [T_CB_TEACHER] ([tId], [tName], [sex], [teachingAge], [tNo], [phone], [email], [address], [createTime]) VALUES (N'5', N'李四', N'1', N'5', N'123               ', N'111        ', N'1231@11.cvom', N'11', N'2014-01-22 14:31:35.247');
GO
SET IDENTITY_INSERT [T_CB_TEACHER] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for [T_CB_USERINFO]
-- ----------------------------
DROP TABLE [T_CB_USERINFO]
GO
CREATE TABLE [T_CB_USERINFO] (
[userId] int NOT NULL IDENTITY(1,1) ,
[loginName] varchar(32) NOT NULL ,
[loginPwd] varchar(32) NOT NULL ,
[fkId] int NULL ,
[userType] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[T_CB_USERINFO]', RESEED, 6)
GO

-- ----------------------------
-- Records of T_CB_USERINFO
-- ----------------------------
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT [T_CB_USERINFO] ON
GO
INSERT INTO [T_CB_USERINFO] ([userId], [loginName], [loginPwd], [fkId], [userType]) VALUES (N'1', N'admin', N'123456', null, N'1');
INSERT INTO [T_CB_USERINFO] ([userId], [loginName], [loginPwd], [fkId], [userType]) VALUES (N'2', N'zhangsan', N'123456', N'6', N'2');
INSERT INTO [T_CB_USERINFO] ([userId], [loginName], [loginPwd], [fkId], [userType]) VALUES (N'3', N'lisi', N'123456', N'5', N'3');
INSERT INTO [T_CB_USERINFO] ([userId], [loginName], [loginPwd], [fkId], [userType]) VALUES (N'4', N'wangwu', N'123456', N'4', N'3');
INSERT INTO [T_CB_USERINFO] ([userId], [loginName], [loginPwd], [fkId], [userType]) VALUES (N'5', N'jack', N'123456', N'15', N'2');
INSERT INTO [T_CB_USERINFO] ([userId], [loginName], [loginPwd], [fkId], [userType]) VALUES (N'6', N'test1', N'123456', N'16', N'2');
GO
SET IDENTITY_INSERT [T_CB_USERINFO] OFF
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Indexes structure for table T_CB_ENROL
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_ENROL]
-- ----------------------------
ALTER TABLE [T_CB_ENROL] ADD PRIMARY KEY ([enrolId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_EXAM
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_EXAM]
-- ----------------------------
ALTER TABLE [T_CB_EXAM] ADD PRIMARY KEY ([examId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_EXAM_QUESTION
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_EXAM_QUESTION]
-- ----------------------------
ALTER TABLE [T_CB_EXAM_QUESTION] ADD PRIMARY KEY ([eqId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_GRADE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_GRADE]
-- ----------------------------
ALTER TABLE [T_CB_GRADE] ADD PRIMARY KEY ([gradeId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_HOMEWORK
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_HOMEWORK]
-- ----------------------------
ALTER TABLE [T_CB_HOMEWORK] ADD PRIMARY KEY ([hwId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_HOMEWORK_COMMENTS
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_HOMEWORK_COMMENTS]
-- ----------------------------
ALTER TABLE [T_CB_HOMEWORK_COMMENTS] ADD PRIMARY KEY ([hwcId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_HOMEWORK_LOG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_HOMEWORK_LOG]
-- ----------------------------
ALTER TABLE [T_CB_HOMEWORK_LOG] ADD PRIMARY KEY ([hwLogId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_MENUS
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_MENUS]
-- ----------------------------
ALTER TABLE [T_CB_MENUS] ADD PRIMARY KEY ([MenuId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_NETWORKCOURSE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_NETWORKCOURSE]
-- ----------------------------
ALTER TABLE [T_CB_NETWORKCOURSE] ADD PRIMARY KEY ([nwId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_OPTIONS
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_OPTIONS]
-- ----------------------------
ALTER TABLE [T_CB_OPTIONS] ADD PRIMARY KEY ([optionId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_QUESTIONS
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_QUESTIONS]
-- ----------------------------
ALTER TABLE [T_CB_QUESTIONS] ADD PRIMARY KEY ([questionID])
GO

-- ----------------------------
-- Indexes structure for table T_CB_RECOMMEND
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_RECOMMEND]
-- ----------------------------
ALTER TABLE [T_CB_RECOMMEND] ADD PRIMARY KEY ([recId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_RESOURCE
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_RESOURCE]
-- ----------------------------
ALTER TABLE [T_CB_RESOURCE] ADD PRIMARY KEY ([resourceID])
GO

-- ----------------------------
-- Indexes structure for table T_CB_STU_EXAM
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_STU_EXAM]
-- ----------------------------
ALTER TABLE [T_CB_STU_EXAM] ADD PRIMARY KEY ([stu_examId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_STU_HOMEWORK
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_STU_HOMEWORK]
-- ----------------------------
ALTER TABLE [T_CB_STU_HOMEWORK] ADD PRIMARY KEY ([stu_hwId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_STUDENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_STUDENT]
-- ----------------------------
ALTER TABLE [T_CB_STUDENT] ADD PRIMARY KEY ([sid])
GO

-- ----------------------------
-- Indexes structure for table T_CB_SUBJECT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_SUBJECT]
-- ----------------------------
ALTER TABLE [T_CB_SUBJECT] ADD PRIMARY KEY ([subjectId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_TEACHER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_TEACHER]
-- ----------------------------
ALTER TABLE [T_CB_TEACHER] ADD PRIMARY KEY ([tId])
GO

-- ----------------------------
-- Indexes structure for table T_CB_USERINFO
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [T_CB_USERINFO]
-- ----------------------------
ALTER TABLE [T_CB_USERINFO] ADD PRIMARY KEY ([userId])
GO

-- ----------------------------
-- Foreign Key structure for table [T_CB_NETWORKCOURSE]
-- ----------------------------
ALTER TABLE [T_CB_NETWORKCOURSE] ADD FOREIGN KEY ([gradeId]) REFERENCES [T_CB_GRADE] ([gradeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [T_CB_STUDENT]
-- ----------------------------
ALTER TABLE [T_CB_STUDENT] ADD FOREIGN KEY ([gradeId]) REFERENCES [T_CB_GRADE] ([gradeId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
