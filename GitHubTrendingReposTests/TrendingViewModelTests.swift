//
//  TrendingViewModelTests.swift
//  GitHubTrendingReposTests
//
//  Created by Calin Radu Calin on 24.11.2023.
//

import XCTest
@testable import GitHubTrendingRepos

@MainActor
final class TrendingViewModelTests: XCTestCase {
    
    func testFetchTodayTrendingReposSuccess() async {
        //  GIVEN
        let dataClient = TrendingReposDataClientMock(response: .success([.previewSager, .previewTldraw]))
        let viewModel = TrendingViewModel(dataClient: dataClient)
        viewModel.periodFilter = .daily

        //  WHEN
        await viewModel.fetchTrendingRepos()

        //  THEN
        XCTAssertEqual(viewModel.state, .success)
        XCTAssertEqual(viewModel.repositories.count, 2)
        XCTAssertEqual(viewModel.repositories.first?.item, Repository.previewSager)
        XCTAssertEqual(viewModel.repositories.first?.period, TrendingPeriodFilter.daily)
        XCTAssertEqual(viewModel.repositories.last?.item, Repository.previewTldraw)
        XCTAssertEqual(viewModel.repositories.last?.period, TrendingPeriodFilter.daily)
    }
    
    func testFetchWeeklyTrendingReposSuccess() async {
        //  GIVEN
        let dataClient = TrendingReposDataClientMock(response: .success([.previewSager, .previewTldraw]))
        let viewModel = TrendingViewModel(dataClient: dataClient)
        viewModel.periodFilter = .weekly

        //  WHEN
        await viewModel.fetchTrendingRepos()

        //  THEN
        XCTAssertEqual(viewModel.state, .success)
        XCTAssertEqual(viewModel.repositories.count, 2)
        XCTAssertEqual(viewModel.repositories.first?.item, Repository.previewSager)
        XCTAssertEqual(viewModel.repositories.first?.period, TrendingPeriodFilter.weekly)
        XCTAssertEqual(viewModel.repositories.last?.item, Repository.previewTldraw)
        XCTAssertEqual(viewModel.repositories.last?.period, TrendingPeriodFilter.weekly)
    }
    
    
    func testFetchMonthlyTrendingReposSuccess() async {
        //  GIVEN
        let dataClient = TrendingReposDataClientMock(response: .success([.previewSager, .previewTldraw]))
        let viewModel = TrendingViewModel(dataClient: dataClient)
        viewModel.periodFilter = .monthly

        //  WHEN
        await viewModel.fetchTrendingRepos()

        //  THEN
        XCTAssertEqual(viewModel.state, .success)
        XCTAssertEqual(viewModel.repositories.count, 2)
        XCTAssertEqual(viewModel.repositories.first?.item, Repository.previewSager)
        XCTAssertEqual(viewModel.repositories.first?.period, TrendingPeriodFilter.monthly)
        XCTAssertEqual(viewModel.repositories.last?.item, Repository.previewTldraw)
        XCTAssertEqual(viewModel.repositories.last?.period, TrendingPeriodFilter.monthly)
    }
    
    func testFetchTrendingReposFailure() async {
        //  GIVEN
        let dataClient = TrendingReposDataClientMock(response: .failure(.trendingRepos))
        let viewModel = TrendingViewModel(dataClient: dataClient)
        
        //  WHEN
        await viewModel.fetchTrendingRepos()

        //  THEN
        XCTAssertEqual(viewModel.state, .failure(.trendingRepos))
        XCTAssertTrue(viewModel.repositories.isEmpty)
    }
}

private struct TrendingReposDataClientMock: TrendingReposDataClient & TestDataClient {
    let response: Result<[Repository], DataError>
    
    func fetchTrendingRepos(periodfilter: TrendingPeriodFilter) async throws -> [Repository] {
        switch response {
        case let .success(success):
            return success
        case let .failure(failure):
            throw failure
        }
    }
}
