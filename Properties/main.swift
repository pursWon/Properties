//
//  PropertiesApp.swift
//  Properties
//
//  Created by MacBook Air on 2022/07/06.
//

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 범위 값은 0, 1, 2이다
rangeOfThreeItems.firstValue = 6
// 범위 값은 6, 7, 8이다

// firstValue에 첫 값을 저장하고 length에 그 길이를 각각의 프로퍼티에 저장하였다.

var rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
rangeOfFourItems.firstValue = 0 // let의 구조체였으면 프로퍼티에 할당이 불가능하므로 에러가 발생한다.

// rangeOfFourItems는 상수(let)으로 선언되었으므로 프로퍼티를 변경할 수 없다. 구조체가 아니라 클래스는 let으로 설정되었어도
// 프로퍼티는 변경이 가능하다. 그 이유는 클래스의 인스턴스는 참조 타입이기 때문이다.

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 인스턴스는 이 시점에 생성되어 있지 않습니다.

print(manager.importer.fileName)
// the DataImporter 인스턴스가 생성되었다.
// "data.txt 파일을 출력한다.

// manager.importer.filename가 실행되서 importer 프로퍼티에 처음 접근할 때에 비로소 importer 인스턴스는 생성된다.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the Volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// "the Volume of fourByFiveByTwo is 40.0" 출력
// 바로 위의 코드는 volume이라는 읽기 전용 계산된 프로퍼티를 사용한 예시이다.



struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
// 클래스에서는 static과 class 이렇게 2가지 형태로 타입 프로퍼티를 선언이 가능한데 두 가지 경우의 차이는 서브클래스에서 overriding이
// 의 가능 여부이다. class로 선언된 프로퍼티는 서브클래스에서 오버라이드가 가능하다. 위의 예시는, 구조체, 열거형, 클래스에서의 타입 프로퍼티
// 이다.
