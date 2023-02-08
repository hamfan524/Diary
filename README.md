# 📒Diary
## 📖 목차
1. [소개](#🌱-소개)
2. [Tree](#🌲-tree)
3. [타임라인](#⏰-타임라인)
4. [실행 화면](#📱-실행-화면)

## 🌱 소개
간단한 일기장 앱입니다.

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.7.2-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-14.2-blue)]()
[![SnapKit](https://img.shields.io/badge/SnapKit-5.0.0-white)]()

## 🌲 Tree
```
📂Diary
  ┣ 📂App
  ┃ ┣ 📂Assets.xcassets
  ┃ ┃ ┣ 📂AccentColor.colorset
  ┃ ┃ ┃ ┗ 📜Contents.json
  ┃ ┃ ┣ 📂AppIcon.appiconset
  ┃ ┃ ┃ ┗ 📜Contents.json
  ┃ ┃ ┗ 📜Contents.json
  ┃ ┣ 📂Base.lproj
  ┃ ┃ ┗ 📜LaunchScreen.storyboard
  ┃ ┣ 📜AppDelegate.swift
  ┃ ┣ 📜Info.plist
  ┃ ┗ 📜SceneDelegate.swift
  ┣ 📂CoreData
  ┃ ┣ 📂Diary.xcdatamodeld
  ┃ ┃ ┣ 📂Diary.xcdatamodel
  ┃ ┃ ┃ ┗ 📜contents
  ┃ ┃ ┗ 📜.xccurrentversion
  ┃ ┣ 📜DiaryEntity+CoreDataClass.swift
  ┃ ┗ 📜DiaryEntity+CoreDataProperties.swift
  ┣ 📂Controller
  ┃ ┣ 📜DiaryViewController.swift
  ┃ ┗ 📜TableViewController.swift
  ┣ 📂View
  ┃ ┣ 📜DiaryView.swift
  ┃ ┣ 📜TableView.swift
  ┃ ┗ 📜TableViewCell.swift
  ┗ 📂Util
    ┗ 📜UIFont+Extension.swift
```
## ⏰ 타임라인

<details>
<summary>Step 1 타임라인</summary>

* 2023.01.26
    * TableViewController 구현
    * Custom TableViewCell 구현
    * 다이어리 추가 버튼 및 추가 화면 구현
* 2023.01.27
    * 코어데이터 CRUD 구현
    * 코어데이터와 UI 연동
    * 내용 수정 시 CoreData에 자동 업데이트하는 기능 구현
    * 프로젝트 폴더구조 변경
</details>

<details>
<summary>Step 2 타임라인</summary>

* 2023.01.30
    * 키보드 내용 가리지 않도록 구현
    * TableView에서 저장날짜 확인 기능 구현
* 2023.01.31
    * tableView 날짜 내림차순 정렬

</details>

## 📱 실행 화면

|새일기 열기|날짜 내림차순 정렬|
|:--:|:--:|
|![화면_기록_2023-02-09_오전_3_29_46_AdobeExpress](https://user-images.githubusercontent.com/37105602/217622380-e093cf0a-83a4-4a48-892f-44ca72fd074e.gif)|![화면_기록_2023-02-09_오전_3_32_54_AdobeExpress](https://user-images.githubusercontent.com/37105602/217623550-24f48cf5-bde6-4ee2-a137-a3d183f19782.gif)|

삭제|키보드 
:--:|:--:
![화면_기록_2023-02-09_오전_3_35_43_AdobeExpress](https://user-images.githubusercontent.com/37105602/217625915-45e82acc-63e8-4f00-ae55-8faef53cd778.gif)|![화면_기록_2023-02-09_오전_3_35_06_AdobeExpress](https://user-images.githubusercontent.com/37105602/217624993-3f72da45-85da-4031-8940-3b1a00a5a83b.gif)


자동저장기능|
:--:|
![화면_기록_2023-02-09_오전_3_48_21_AdobeExpress](https://user-images.githubusercontent.com/37105602/217624378-80c9f7f5-1589-40a3-9efe-d8a8ab4493d6.gif)|

