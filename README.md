# HwangInJun
🖥 26 Sopt OB iOS 황인준 🖥
***

| 주차  |                      실습 내용 및 주제                       | 구현 |
| :---: | :----------------------------------------------------------: | :--: |
| 1주차 | View 전환 및 데이터 전달 / 네비게이션 컨트로러를 이용한 Login Logout 화면 제작 |  🔵   |
| 2주차 | StackView ScrollView를 이용한 다양한 AutoLayOut 공부 및 View 제작 |  🔵   |
| 3주차 | Delegate & Protocol, UIPickerVIew, UITableView, UICollectionView 전체적으로 톺아보다. |  🔵   |
| 4주차 | AlamoFire를 이용한 Post통신 및 Login LogOut 통신하기 + 회원가입 실습 |  🔵   |
| 5주차 | 디자인 + iOS 합동 세미나 / 국방부앱 리뉴얼 제작 완성 (ScrollView + CollectionView + CustomTabbar) |  🔵   |
| 6주차 | Server + iOS 합동 세미나 / 서버APi를 이용해 Data를 get통신 후 , View에 맞게 대입 |  🔵   |

***

* readMe 수정중,,, 플젝 및 사진 추가 첨부 하여야함 ,, ing ,,,,



* [1차 뷰 전환 과제](https://github.com/26th-SOPT-iOS/HwangInJoon/tree/master/과제/26th_iOS_FirstAssignment) - 완료

* present는 스토리보드로 , push는 코드로

```swift
@IBAction func touchUpRedButton(_ sender: Any) {        
guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "RedVC") as? RedViewController else { return  }

self.navigationController?.pushViewController(nextVC, animated: true)
        
}
```



* [1차 로그인 뷰 과제](https://github.com/26th-SOPT-iOS/HwangInJoon/tree/master/과제/LoginAssignment) - 완료

```swift
pwTextField.isSecureTextEntry = true
//textField 암호값으로 변경 + 보안
```



```swift
 self.present(nextVC, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
//회원가입화면뷰 - 다음뷰를 프레젠트하며, 컴플리션을 이용해 네비게이션 컨트롤러의 뷰컨을 팝해준다.
```

***

## Design + Server + iOS 합동 세미나 및 과제 [4,5,6차 세미나 통합]

****

* 국방부 앱 [TheCamp]앱 리뉴얼
* HomeButton이 있는 커스텀 탭바 컨트롤러 -> 뷰와 버튼을 커스텀해서 새로운 탭바형태 기능의 탭바 뷰를 제작(커스텀이 더욱 용이)
* HomeButton은 항상 지정된 위치에 고정 및 고정된 기능이므로, SuperView에 위치를 고정
* 스크롤뷰 안에 컬렉션뷰로 구성된 레이아웃 , 단 컬렉션뷰는 Carousel 효과를 주었음 
* PageViewController를 이용해서 구현했지만, 좌우의 뷰 아이템이 살짝씩 보여야 하는데 PageViewController로는 힘들어서 컬렉션뷰로 수정

### ![TheCampt시연](https://user-images.githubusercontent.com/55793344/84371986-6fe83100-ac15-11ea-9024-9f1f519cc7af.gif)