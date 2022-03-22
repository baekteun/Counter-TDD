import Quick
import XCTest
import Nimble
@testable import Counter

class CounterViewModelSpec: QuickSpec {
    override func spec() {
        describe("View가 로드되고") {
            var viewModel: CounterViewModel!
            beforeEach {
                viewModel = CounterViewModel()
            }
            context("+ 버튼을 누르면") {
                beforeEach {
                    viewModel.apply(.plusButtonDidTap)
                }
                it("viewModel의 count가 1증가한다") {
                    expect(viewModel.count).to(equal(1))
                }
            }
            context("- 버튼을 누르면") {
                beforeEach {
                    viewModel.apply(.minusButtonDidTap)
                }
                it("viewModel의 count가 1감소한다") {
                    expect(viewModel.count).to(equal(-1))
                }
            }
            context("Reset 버튼을 누르면") {
                var score: Int!
                beforeEach {
                    score = viewModel.secret
                    viewModel.apply(.resetButtonDidTap)
                }
                it("viewModel의 count가 0이 된다") {
                    expect(viewModel.count).to(equal(0))
                }
                it("viewModel의 secret이 재생성된다") {
                    expect(viewModel.secret).toNot(equal(score))
                }
            }
            context("viewModel의 count의 값이 바뀔때 secret보다 크다면") {
                beforeEach {
                    viewModel.count = viewModel.secret + 1
                }
                it("checkResults가 .heigher가 된다") {
                    expect(viewModel.checkResults).to(equal(.higher))
                }
            }
            context("viewModel의 count의 값이 바뀔때 secret보다 작다면") {
                beforeEach {
                    viewModel.count = viewModel.secret - 1
                }
                it("checkResults가 .lower가 된다") {
                    expect(viewModel.checkResults).to(equal(.lower))
                }
            }
            context("viewModel의 count의 값이 바뀔때 secret과 같다면") {
                beforeEach {
                    viewModel.count = viewModel.secret
                }
                it("checkResults가 .equal가 된다") {
                    expect(viewModel.checkResults).to(equal(.equal))
                }
            }
        }
    }
}
