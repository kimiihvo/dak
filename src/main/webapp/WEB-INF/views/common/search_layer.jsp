<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div id="search-layer">
    <div class="search-header-wrap">
        <div class="search-header">
            <a href=""><img class="search-layer-close" src="${pageContext.request.contextPath}/assets/img/kind_back_btn.png" alt="뒤로가기버튼"></a>
            <form method="get" action="${pageContext.request.contextPath}/shop/search_result.do">
                <input class="search-bar" type="search" name="keyword" id="search-bar">
                <a href=""><img src="${pageContext.request.contextPath}/assets/img/control_clear.png" alt="삭제버튼"></a>
                <div class="search-btn">
                    <input type="submit" value="검색" name="search-btn">
                </div>
            </form>
        </div>
    </div>


    <div class="search-content-wrap">
        <div class="search-content">

            <div class="search-hot">
                <h3>인기 검색어</h3>
                <ul class="first">
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=다이어트 도시락&search-btn=검색"><span>1</span>다이어트 도시락</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=스테이크&search-btn=검색"><span>2</span>스테이크</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=샐러드&search-btn=검색"><span>3</span>샐러드</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=볶음밥&search-btn=검색"><span>4</span>볶음밥</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=닭가슴살&search-btn=검색"><span>5</span>닭가슴살</a></li>
                </ul>
                <ul class="second">
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=특급배송&search-btn=검색"><span>6</span>타임세일</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=스테이크&search-btn=검색"><span>7</span>스테이크</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=슬라이스&search-btn=검색"><span>8</span>슬라이스</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=쉐이크&search-btn=검색"><span>9</span>쉐이크</a></li>
                    <li><a href="${pageContext.request.contextPath}/shop/search_result.do?keyword=아이스크림&search-btn=검색"><span>10</span>아이스크림</a></li>
                </ul>
            </div>

            <!-- <div class="search-recent">
                <div class="search-recent-top">
                    <h3>최근 검색어<a href="">전체삭제</a></h3>

                </div>
                <ul>
                    <li class="search-empty">최근 검색 내역이 없습니다</li>
                </ul>
            </div> -->
        </div>
    </div>
</div>