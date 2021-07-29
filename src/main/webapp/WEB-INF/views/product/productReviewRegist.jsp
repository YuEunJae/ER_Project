<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/hyungki.css">
</head>

<!-- 후기 작성 및 등록하기 -->
<section class="sect-main">
	<div class="container" style="margin-bottom: 75px;">
		<div class="row">
			<div class="content-wrap">
				<div class="titlebox">
					<p>후기 작성하기</p>
				</div>
				<form action="registForm" method="post">
					<!-- 같이 넘겨줘야할 데이터입니다. -->
					<input type="hidden" id="pcode" name="pcode" value="${pcode }">
					<input type="hidden" id="helpcount" name="helpcount" value=0>
					<table class="table">
						<tbody class="t-control">
							<tr>
								<td class="t-title">작성자</td>
								<td><input class="form-control input-sm" name="writer"
									value="${sessionScope.userVO.userId }" readonly required></td>
							</tr>
							<tr>
								<td class="t-title">제목</td>
								<td><input class="form-control input-sm" name="title"
									required></td>
							</tr>
							<tr>
								<td class="t-title">별점주기</td>
								<td><select class="sel-star form-control" name="star"
									style="width: 200px;">
										<option value="5">★★★★★(5점)</option>
										<option value="4">★★★★☆(4점)</option>
										<option value="3">★★★☆☆(3점)</option>
										<option value="2">★★☆☆☆(2점)</option>
										<option value="1">★☆☆☆☆(1점)</option>
								</select></td>
							</tr>
							<tr>
								<td class="t-title">내용</td>
								<td><textarea class="form-control" rows="7" name="content"
										required></textarea></td>
							</tr>
						</tbody>
					</table>

					<div class="titlefoot">
						<button type="submit" class="btn btn-default reviewRegistBtn">등록</button>
						<button type="button" class="btn btn-default reviewListBtn"
							onclick="location.href='productMain?pcode=${pcode}&pnScroll=true'">목록</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</section>

<script>

</script>


