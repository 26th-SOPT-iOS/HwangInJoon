# HwangInJun
황인준
***





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



