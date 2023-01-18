<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.fourmeeting.bee.bees.model.vo.Bees"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비즈 설정</title>
<!--구글 노토 산스 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/beeSetting/beeSettingSubJoinStandard.css">
</head>
<body>
<%
	Bees beeResult = (Bees)request.getAttribute("beeResult");
	/* Member sessionMember = (Member)session.getAttribute("member"); */
%>
<main id="content" role="main" class="midContent" data-uiselector="contentRegion">
<div data-viewname="DBandJoinConditionView" class="sSettingBand gContentCardShadow">
<form action="subJoinStandardSet.do" method="post">
	<div class="uHeaderWrap -h50">
	    <header class="header beeHeaderColor">
	        <h1 class="title">가입 조건 설정</h1>
	    </header>
	</div>
	
	<ul class="sSettingList">
	
	    <li class="sSettingItem">
	        <div class="itemContent">
			    <label for="gender" class="label">성별</label>
	        </div>
	        <div class="itemSide -wAuto">
	        <input type="hidden" id="beesNo" name="beesNo" value="<%=beeResult.getBeesNo() %>"/>
	            <span class="uSelect -bg" style="min-width:105px">
	                <select id="gender" name="gender" class="_selectGender gColorBk4">
	                    <option value="N">제한없음</option>
	                    <option value="M">남성</option>
	                    <option value="F">여성</option>
	                </select>
	            </span>
	        </div>
	    </li>
	
	    <li class="sSettingItem">
	        <div class="itemContent">
	            <span class="label">나이</span>
	        </div>
	        <div class="itemSide -wAuto">
	            <span class="uTableList -wAuto -inline gMal20">
	                <label for="maxAge" class="cell gColorBk4">최소나이</label>
	                <span class="cell gPal10">
	                    <span class="uSelect -bg" style="min-width:77px">
	                        <select id="maxAge" name="maxAge" class="_selectMaxYear gColorBk4">
	                            <option value="0">제한없음</option>
	                                    
	                            <option value="2021">2021년생</option>
	                                    
	                            <option value="2020">2020년생</option>
	                                    
	                            <option value="2019">2019년생</option>
	                                    
	                            <option value="2018">2018년생</option>
	                                    
	                            <option value="2017">2017년생</option>
	                                    
	                            <option value="2016">2016년생</option>
	                                    
	                            <option value="2015">2015년생</option>
	                                    
	                            <option value="2014">2014년생</option>
	                                    
	                            <option value="2013">2013년생</option>
	                                    
	                            <option value="2012">2012년생</option>
	                                    
	                            <option value="2011">2011년생</option>
	                                    
	                            <option value="2010">2010년생</option>
	                                    
	                            <option value="2009">2009년생</option>
	                                    
	                            <option value="2008">2008년생</option>
	                                    
	                            <option value="2007">2007년생</option>
	                                    
	                            <option value="2006">2006년생</option>
	                                    
	                            <option value="2005">2005년생</option>
	                                    
	                            <option value="2004">2004년생</option>
	                                    
	                            <option value="2003">2003년생</option>
	                                    
	                            <option value="2002">2002년생</option>
	                                    
	                            <option value="2001">2001년생</option>
	                                    
	                            <option value="2000">2000년생</option>
	                                    
	                            <option value="1999">1999년생</option>
	                                    
	                            <option value="1998">1998년생</option>
	                                    
	                            <option value="1997">1997년생</option>
	                                    
	                            <option value="1996">1996년생</option>
	                                    
	                            <option value="1995">1995년생</option>
	                                    
	                            <option value="1994">1994년생</option>
	                                    
	                            <option value="1993">1993년생</option>
	                                    
	                            <option value="1992">1992년생</option>
	                                    
	                            <option value="1991">1991년생</option>
	                                    
	                            <option value="1990">1990년생</option>
	                                    
	                            <option value="1989">1989년생</option>
	                                    
	                            <option value="1988">1988년생</option>
	                                    
	                            <option value="1987">1987년생</option>
	                                    
	                            <option value="1986">1986년생</option>
	                                    
	                            <option value="1985">1985년생</option>
	                                    
	                            <option value="1984">1984년생</option>
	                                    
	                            <option value="1983">1983년생</option>
	                                    
	                            <option value="1982">1982년생</option>
	                                    
	                            <option value="1981">1981년생</option>
	                                    
	                            <option value="1980">1980년생</option>
	                                    
	                            <option value="1979">1979년생</option>
	                                    
	                            <option value="1978">1978년생</option>
	                                    
	                            <option value="1977">1977년생</option>
	                                    
	                            <option value="1976">1976년생</option>
	                                    
	                            <option value="1975">1975년생</option>
	                                    
	                            <option value="1974">1974년생</option>
	                                    
	                            <option value="1973">1973년생</option>
	                                    
	                            <option value="1972">1972년생</option>
	                                    
	                            <option value="1971">1971년생</option>
	                                    
	                            <option value="1970">1970년생</option>
	                                    
	                            <option value="1969">1969년생</option>
	                                    
	                            <option value="1968">1968년생</option>
	                                    
	                            <option value="1967">1967년생</option>
	                                    
	                            <option value="1966">1966년생</option>
	                                    
	                            <option value="1965">1965년생</option>
	                                    
	                            <option value="1964">1964년생</option>
	                                    
	                            <option value="1963">1963년생</option>
	                                    
	                            <option value="1962">1962년생</option>
	                                    
	                            <option value="1961">1961년생</option>
	                                    
	                            <option value="1960">1960년생</option>
	                                    
	                            <option value="1959">1959년생</option>
	                                    
	                            <option value="1958">1958년생</option>
	                                    
	                            <option value="1957">1957년생</option>
	                                    
	                            <option value="1956">1956년생</option>
	                                    
	                            <option value="1955">1955년생</option>
	                                    
	                            <option value="1954">1954년생</option>
	                                    
	                            <option value="1953">1953년생</option>
	                                    
	                            <option value="1952">1952년생</option>
	                                    
	                            <option value="1951">1951년생</option>
	                                    
	                            <option value="1950">1950년생</option>
	                                    
	                            <option value="1949">1949년생</option>
	                                    
	                            <option value="1948">1948년생</option>
	                                    
	                            <option value="1947">1947년생</option>
	                                    
	                            <option value="1946">1946년생</option>
	                                    
	                            <option value="1945">1945년생</option>
	                                    
	                            <option value="1944">1944년생</option>
	                                    
	                            <option value="1943">1943년생</option>
	                                    
	                            <option value="1942">1942년생</option>
	                                    
	                            <option value="1941">1941년생</option>
	                                    
	                            <option value="1940">1940년생</option>
	                                    
	                            <option value="1939">1939년생</option>
	                                    
	                            <option value="1938">1938년생</option>
	                                    
	                            <option value="1937">1937년생</option>
	                                    
	                            <option value="1936">1936년생</option>
	                                    
	                            <option value="1935">1935년생</option>
	                                    
	                            <option value="1934">1934년생</option>
	                                    
	                            <option value="1933">1933년생</option>
	                                    
	                            <option value="1932">1932년생</option>
	                                    
	                            <option value="1931">1931년생</option>
	                                    
	                            <option value="1930">1930년생</option>
	                                    
	                            <option value="1929">1929년생</option>
	                                    
	                            <option value="1928">1928년생</option>
	                                    
	                            <option value="1927">1927년생</option>
	                                    
	                            <option value="1926">1926년생</option>
	                                    
	                            <option value="1925">1925년생</option>
	                                    
	                            <option value="1924">1924년생</option>
	                                    
	                            <option value="1923">1923년생</option>
	                                    
	                            <option value="1922">1922년생</option>
	                                    
	                            <option value="1921">1921년생</option>
	                                    
	                        </select>
	                    </span>
	                </span>
	
	                <span class="cell gPal16 gPar16 gColorBk4">-</span>
	
	                <label for="minAge" class="cell gColorBk4">최대나이</label>
	                <span class="cell gPal10">
	                    <span class="uSelect -bg" style="min-width:77px">
	                        <select id="minAge" name="minAge" class="_selectMinYear gColorBk4">
	                            <option value="0">제한없음</option>
	                                    
	                            <option value="2021">2021년생</option>
	                                    
	                            <option value="2020">2020년생</option>
	                                    
	                            <option value="2019">2019년생</option>
	                                    
	                            <option value="2018">2018년생</option>
	                                    
	                            <option value="2017">2017년생</option>
	                                    
	                            <option value="2016">2016년생</option>
	                                    
	                            <option value="2015">2015년생</option>
	                                    
	                            <option value="2014">2014년생</option>
	                                    
	                            <option value="2013">2013년생</option>
	                                    
	                            <option value="2012">2012년생</option>
	                                    
	                            <option value="2011">2011년생</option>
	                                    
	                            <option value="2010">2010년생</option>
	                                    
	                            <option value="2009">2009년생</option>
	                                    
	                            <option value="2008">2008년생</option>
	                                    
	                            <option value="2007">2007년생</option>
	                                    
	                            <option value="2006">2006년생</option>
	                                    
	                            <option value="2005">2005년생</option>
	                                    
	                            <option value="2004">2004년생</option>
	                                    
	                            <option value="2003">2003년생</option>
	                                    
	                            <option value="2002">2002년생</option>
	                                    
	                            <option value="2001">2001년생</option>
	                                    
	                            <option value="2000">2000년생</option>
	                                    
	                            <option value="1999">1999년생</option>
	                                    
	                            <option value="1998">1998년생</option>
	                                    
	                            <option value="1997">1997년생</option>
	                                    
	                            <option value="1996">1996년생</option>
	                                    
	                            <option value="1995">1995년생</option>
	                                    
	                            <option value="1994">1994년생</option>
	                                    
	                            <option value="1993">1993년생</option>
	                                    
	                            <option value="1992">1992년생</option>
	                                    
	                            <option value="1991">1991년생</option>
	                                    
	                            <option value="1990">1990년생</option>
	                                    
	                            <option value="1989">1989년생</option>
	                                    
	                            <option value="1988">1988년생</option>
	                                    
	                            <option value="1987">1987년생</option>
	                                    
	                            <option value="1986">1986년생</option>
	                                    
	                            <option value="1985">1985년생</option>
	                                    
	                            <option value="1984">1984년생</option>
	                                    
	                            <option value="1983">1983년생</option>
	                                    
	                            <option value="1982">1982년생</option>
	                                    
	                            <option value="1981">1981년생</option>
	                                    
	                            <option value="1980">1980년생</option>
	                                    
	                            <option value="1979">1979년생</option>
	                                    
	                            <option value="1978">1978년생</option>
	                                    
	                            <option value="1977">1977년생</option>
	                                    
	                            <option value="1976">1976년생</option>
	                                    
	                            <option value="1975">1975년생</option>
	                                    
	                            <option value="1974">1974년생</option>
	                                    
	                            <option value="1973">1973년생</option>
	                                    
	                            <option value="1972">1972년생</option>
	                                    
	                            <option value="1971">1971년생</option>
	                                    
	                            <option value="1970">1970년생</option>
	                                    
	                            <option value="1969">1969년생</option>
	                                    
	                            <option value="1968">1968년생</option>
	                                    
	                            <option value="1967">1967년생</option>
	                                    
	                            <option value="1966">1966년생</option>
	                                    
	                            <option value="1965">1965년생</option>
	                                    
	                            <option value="1964">1964년생</option>
	                                    
	                            <option value="1963">1963년생</option>
	                                    
	                            <option value="1962">1962년생</option>
	                                    
	                            <option value="1961">1961년생</option>
	                                    
	                            <option value="1960">1960년생</option>
	                                    
	                            <option value="1959">1959년생</option>
	                                    
	                            <option value="1958">1958년생</option>
	                                    
	                            <option value="1957">1957년생</option>
	                                    
	                            <option value="1956">1956년생</option>
	                                    
	                            <option value="1955">1955년생</option>
	                                    
	                            <option value="1954">1954년생</option>
	                                    
	                            <option value="1953">1953년생</option>
	                                    
	                            <option value="1952">1952년생</option>
	                                    
	                            <option value="1951">1951년생</option>
	                                    
	                            <option value="1950">1950년생</option>
	                                    
	                            <option value="1949">1949년생</option>
	                                    
	                            <option value="1948">1948년생</option>
	                                    
	                            <option value="1947">1947년생</option>
	                                    
	                            <option value="1946">1946년생</option>
	                                    
	                            <option value="1945">1945년생</option>
	                                    
	                            <option value="1944">1944년생</option>
	                                    
	                            <option value="1943">1943년생</option>
	                                    
	                            <option value="1942">1942년생</option>
	                                    
	                            <option value="1941">1941년생</option>
	                                    
	                            <option value="1940">1940년생</option>
	                                    
	                            <option value="1939">1939년생</option>
	                                    
	                            <option value="1938">1938년생</option>
	                                    
	                            <option value="1937">1937년생</option>
	                                    
	                            <option value="1936">1936년생</option>
	                                    
	                            <option value="1935">1935년생</option>
	                                    
	                            <option value="1934">1934년생</option>
	                                    
	                            <option value="1933">1933년생</option>
	                                    
	                            <option value="1932">1932년생</option>
	                                    
	                            <option value="1931">1931년생</option>
	                                    
	                            <option value="1930">1930년생</option>
	                                    
	                            <option value="1929">1929년생</option>
	                                    
	                            <option value="1928">1928년생</option>
	                                    
	                            <option value="1927">1927년생</option>
	                                    
	                            <option value="1926">1926년생</option>
	                                    
	                            <option value="1925">1925년생</option>
	                                    
	                            <option value="1924">1924년생</option>
	                                    
	                            <option value="1923">1923년생</option>
	                                    
	                            <option value="1922">1922년생</option>
	                                    
	                            <option value="1921">1921년생</option>
	                                    
	                        </select>
	                    </span>
	                </span>
	            </span>
	        </div>
	    </li>
	</ul>
	<script>
		$("#gender").val("<%=beeResult.getBeesGender()%>").prop("selected", true);
		$("#minAge").val("<%=beeResult.getBeesMinBirth()%>").prop("selected", true);
		$("#maxAge").val("<%=beeResult.getBeesMaxBirth()%>").prop("selected", true);
	</script>
	<div class="btnFooter">
	    <button type="submit" class="_btnConfirmJoinType uButton -sizeL -confirm">저장</button>
	</div>
</form>
</div>
</main>
</body>
</html>