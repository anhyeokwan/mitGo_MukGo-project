# mitGo_MukGo-project
프로젝트 믿고 먹고(맛집 예약 및 마켓) <img src="https://img.shields.io/badge/믿GO먹GO-568A35?style=flat-square&logo=MitgoMukgo&logoColor=568A35"/>
## 개요
맛집정보를 얻고 예약할 수 있는 사이트 & 맛집 음식 그대로 집에서 즐길 수 있는 마켓
##기획의도
단순한 맛집소개사이트가 아닌 이용자별 개인취향에 맞는 맛집소개 목록이 노출되어 이용자들에게 
편의성을 제공하고 업주들의 매장소개와 더불어 이용자들의 자발적 추진시스템을 도입하여 활발한 정보공유를 유도
- 카테고리별 맛집 검색시스템 구축
- 편리한 예약 및 시스템 구현
##개발목표 및 설계 주안
직관적 디자인을 이용한 사용자의 편의성 보
- 타 사이트의 복잡한 구조를 가진 UI/UX를 보완하여 더 간결하고 직관적인 디자인을 이용하여
이용자들의 편의성을 증대하고 간편하게 접속하여 이용에 부담을 느끼지 않게 구성

맛집 소개 - 지역업주들의 매장 홍보효과 증대
- 소상공인들의 매장 홍보효과를 불러일으키고 이용자들의 효과적인 맛집탐색에 효율성을 부
- 카테고리별 검색 시스템으로 이용자들의 취향에 맞는 검색결과 제공

취향별 맛집 분류 시스템
- 이용자 개인의 취향정보에 맞추어 맛집목록을 노출시킴으로써 이용자편의성 증가

## 상세기능
![image](https://user-images.githubusercontent.com/77394673/220669322-8c11e24a-2e57-426e-a1c5-1da504535b2b.png)

## 유사사이트
![image](https://user-images.githubusercontent.com/77394673/220669718-4cd8c2b4-69b8-46ac-b6df-6feaca214430.png)

## 개발환경
- 운영체제 : window10
- 개발도구 : eclipse
- DBMS : Oracle, DB-SQLDeveloper
- Server : Apache Tomcat v8.5
- Language : java, html, css, js, jsp
- 디자인 툴 : bootstrap, W3C
- API : T-MAP api, KG-이니시스 결제 api
- Framework : Spring

## 프로젝트 시 활용해본 대표 기술
- JAVA, JSP
- ajax
- JQuery, JavaScript
- myBatis, maven
- Spring Framework

## 일정
- 2022.10.18 ~ 2022.11.18
- 참여도 : 21%

## 내 구현기능
1. 공지사항
2. Qna
3. FAQ
![image](https://user-images.githubusercontent.com/77394673/220679469-f92b46f2-4264-436f-a394-cc7fccca42e1.png)
4. 북마크
![image](https://user-images.githubusercontent.com/77394673/220679846-2e4f26ea-037f-45de-aada-7c498986ac7a.png)

### 1. 공지사항
#### 1-1. 글쓰기
- 파일업로드기능과 에디터를 이용한 글쓰기 구현
- 파일업로드는 5개까지만 올릴 수 있다.
#### 파일 올리기 전
![image](https://user-images.githubusercontent.com/77394673/220681268-bcb16f11-573f-49d3-9b6a-fe1a39566346.png)
#### 파일을 올린 후
![image](https://user-images.githubusercontent.com/77394673/220681645-2b8f706e-c36f-47f6-9299-aea3c964f2ef.png)

#### 파일 업로드 코드(HTML)
```html
<tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7);">
                        <th>첨부파일(최대 5개)</th>
                        <td style="width: 700px;">
                            <label for="file">
                                <div class="btn-upload">파일 업로드하기</div>
                            </label>
                            <input type="file" name="noticeFile" id="file" multiple>
                        </td>
                    </tr>
                    
                    <tr style="height: 70px; border-bottom: 1px solid rgba(224, 224, 224, 0.7); display: none;" class="fileListTr">
                       <th>첨부파일목록</th>
                       <td style="width: 700px;">
                          <div class="fileList">
                             
                          </div>
                       </td>
                    </tr>
```
#### 파일 업로드 코드(javaScript)
```javascript
const fileZone = $(".fileList");
       const span = $("<span>");
       
       const filesGo = new Array();
       
       $("#file").on("change", function(){
          
          const fileList = $("#file")[0].files;
          console.log(fileList);
          
          if(fileList.length > 5){
            alert("파일은 최대 5개까지만 가능합니다.");
         }else{
            
            for(let i = 0; i < fileList.length; i++){
                filesGo.push(fileList[i]);
                $(".fileListTr").slideDown();
                const fileDiv = $("<div>");
                if(filesGo.length > 5){
                   alert("파일은 최대 5개까지만 가능합니다.");
                   filesGo.pop();
                   break;
                }
                fileDiv.append("<span class=''>" + fileList[i].name + "</span><span class='deleteBtn'>x</span><br>");
                fileZone.append(fileDiv);
             }
            
             $(".deleteBtn").attr("onclick", "deleteFile(this)");
             console.log(filesGo.length);
         }
          
          
       });
       
       function deleteFile(obj){
          const delFile = $(obj).prev().text();
          
          for(let i = 0; i < filesGo.length; i++){
             if(filesGo[i].name == delFile){
                filesGo.splice(i, 1);
                break;
             }
          }
          
          if(filesGo.length == 0){
             $(".fileListTr").slideUp();
             
          }
          
          $(obj).parent().remove();
          
          console.log(filesGo.length);
          
       }
```
#### 파일업로드 코드(java)
- MultipartFile을 이용한 파일 드업로드
```java
@RequestMapping(value="/insertNoticeWrite.do")
	public String insertNotice(Notice notice, MultipartFile[] noticeFile, HttpServletRequest request) {
		// 파일을 담아둘 리스트생성
		ArrayList<NoticeFile> fileList = new ArrayList<NoticeFile>();
		
		// noticeFile배열이 비어있지 않다면
		if(!noticeFile[0].isEmpty()) {
			
			// 파일 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			
			// 반복문으로 파일업로드
			for(MultipartFile files : noticeFile) {
				// 파일 중복체크
				String filename = files.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = files.getBytes();
					
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				NoticeFile nf = new NoticeFile();
				nf.setFilename(filename);
				nf.setFilepath(filepath);
				fileList.add(nf);
				
			}
		}
		
		int result = service.insertNotice(notice, fileList);
		
		return "redirect:/selectNoticeList.do?reqPage=1";
	}
```
#### 파일이름 중복처리
```java
@Component
public class FileRename {
	public String fileRename(String path, String filename) {
		String onlyFilename = filename.substring(0, filename.lastIndexOf(".")); // 파일이름 0번부터 마지막에오는 .앞까지
		String extention = filename.substring(filename.lastIndexOf(".")); // .부터 끝까지 가져옴

		// 실제 업로드할 파일명
		String filepath = null;

		// 파일명이 중복되는 경우 뒤에 붙일 숫자
		int count = 0;
		while (true) {
			if (count == 0) {
				// 파일이름 체크 -> 첫번째 인 경우
				filepath = onlyFilename + extention; // 원래 파일명 그대로(ex : text.txt)
			} else {
				filepath = onlyFilename + "_" + count + extention; // 파일명_숫자.확장자(ex : text_1.txt)
			}
			File checkFile = new File(path + filepath);
			if (!checkFile.exists()) {
				// 파일명이 존재하지않을때 (중복이 아닐때)
				break;
			}
			count++;
		}
		return filepath;
	}
}
```
#### 에디터
- 에디터 : summernote
![image](https://user-images.githubusercontent.com/77394673/220690165-c08256c1-674d-4506-a989-1f68081f6517.png)
```html
<script src="/resources/summernote/summernote-lite.js"></script>
      <script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
      <link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<tr style="height: 400px;">
                        <th style="vertical-align: top; padding-top: 30px;">*내용</th>
                        <td style="text-align: left;">
                            <div class="form-floating" style="padding-top: 30px; padding-bottom: 30px">
                                <textarea class="form-control" name="noticeContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 340px"></textarea>
                                
                            </div>
                        </td>
                    </tr>
```
```javascript
$("[name=noticeContent]").summernote({
          height : 400,
          lang : "ko-KR",
          callbacks : {
             onImageUpload : function(files){
                uploadImage(files[0], this);
             }
          }
       });
       
       function uploadImage(files, editor){
          // <form>태그와 똑같은 기능을 하는 변수
          const form = new FormData();
          form.append("files", files);
          
          $.ajax({
             url : "/noticeEditorUpload.do",
             type : "post",
             data : form,
             processData : false,
             contentType : false,
             success : function(data){
                $(editor).summernote("insertImage", data);
                
                console.log(data);
             }
          });
       }
```
```java
@ResponseBody
	@RequestMapping(value="/noticeEditorUpload.do", produces = "application/json;charset=utf-8")
	public String noticeEditorUpload(MultipartFile[] files, HttpServletRequest request) {
		NoticeFile nf = null;
		
		// 파일이 비어있지 않다면
		if(!files[0].isEmpty()) {
			// 파일 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/editor/");
			// 파일 중복처리
			for(MultipartFile fileList : files) {
				String filename = fileList.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = fileList.getBytes();
					
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				nf = new NoticeFile();
				nf.setFilename(filename);
				nf.setFilepath(filepath);
			}
			
		}
		
		Gson gson = new Gson();
		String result = gson.toJson("/resources/upload/notice/editor/" + nf.getFilepath());
		return result;
	}
```
#### 1-2. 글 목록
![image](https://user-images.githubusercontent.com/77394673/220695065-fe6b6260-de12-4c61-a3db-d20297852aa4.png)
#### 페이징
```java
public HashMap<String, Object> selectAllNotice(int reqPage) {
		// 화면에 보여주는 게시물 수
		int numPerPage = 10;
		
		// 끝페이지
		int end = numPerPage * reqPage;
		
		// 시작
		int start = (end - numPerPage) + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Notice> list = dao.selectAllNotice(map);
		
		int totalCnt = dao.selectNoticeCount();
		
		int totalPage = 0;
		if(totalCnt % numPerPage == 0) {
			totalPage = totalCnt / numPerPage;
		}else {
			totalPage = totalCnt / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = 1;
		
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi +=  "<a href='/selectNoticeList.do?reqPage=" + (pageNo - 1) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_left\r\n" + 
					"            </span></a>";
		}
		
		for(int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='numberDeco'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a href='/selectNoticeList.do?reqPage=" + pageNo + "'><span>" + (pageNo) + "</span></a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/selectNoticeList.do?reqPage=" + (pageNo) + "'><span class='material-symbols-outlined' style='font-size: 30px;'>\r\n" + 
					"            chevron_right\r\n" + 
					"            </span></a>";
		}
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("list", list);
		pageMap.put("pageNavi", pageNavi);
		if(list == null) {
			return null;
		}else {
			return pageMap;
		}
		
	}
```
#### 1-3. 글 상세보기
![image](https://user-images.githubusercontent.com/77394673/220697379-1bb491e5-328f-4cf2-96aa-6fb5e361bc8d.png)
#### 조회수
'''java
public Notice selectOneNotice(int noticeNo) {
		int result = dao.updateReadCount(noticeNo);
		
		Notice n = null;
		
		if(result > 0) {
			n = dao.selectOneNotice(noticeNo);
			ArrayList<NoticeFile> nfList = dao.selectALlNoticeFile(noticeNo);
			n.setFileList(nfList);
			return n;
		}else {
			return null;
		}
		
	}
```
#### 파일다운로드
```html
<c:forEach items="${n.fileList }" var="nf">
				        		<p style="text-align: left; padding-left: 20px;">
				        			<a href="/noticeFileDown.do?noticeFileNo=${nf.noticeFileNo }">${nf.filename }</a>
				        		</p>
				        	</c:forEach>
```

```java
@RequestMapping(value = "/noticeFileDown.do")
	public void noticeFileDown(int noticeFileNo, Model model, HttpServletRequest request, HttpServletResponse respone) {
		NoticeFile notice = service.selectOneNoticeFile(noticeFileNo);
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		String filepath = savePath + notice.getFilepath();
		
		try {
			FileInputStream fis = new FileInputStream(filepath);
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			ServletOutputStream sos = respone.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			
			String resFilename = new String(notice.getFilename().getBytes("UTF-8"), "ISO-8859-1");
			
			respone.setContentType("application/octet-stream");
			respone.setHeader("Content-Disposition", "attachment;filename=" + resFilename);
			
			while(true) {
				int read = bis.read();
				if(read != -1) {
					bos.write(read);
				}else {
					break;
				}
			}
			bis.close();
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
```
#### 1-4. 글 수정
- 게시판이 수정이 성공하면 추가된 파일은 insert하고 제거된 파일은 delete한다.
```java
@RequestMapping("updateNotice.do")
	public String updateNotice(int[] fileNoList, String[] filePathList, Notice n, MultipartFile[] noticeFile, HttpServletRequest request) {
		ArrayList<NoticeFile> list = new ArrayList<NoticeFile>();
		
		if(!noticeFile[0].isEmpty()) {
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			
			for(MultipartFile files : noticeFile) {
				String filename = files.getOriginalFilename();
				String filepath = fileRename.fileRename(savePath, filename);
				
				try {
					FileOutputStream fos = new FileOutputStream(savePath + filepath);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = files.getBytes();
					
					bos.write(bytes);
					bos.close();
					
					NoticeFile nf = new NoticeFile();
					nf.setFilename(filename);
					nf.setFilepath(filepath);
					list.add(nf);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		n.setFileList(list);
		int result = service.updateNotice(n, fileNoList);
		
		if(fileNoList != null && result == (list.size() + fileNoList.length + 1)) {
			if(filePathList != null) {
				for(String path : filePathList) {
					File delFile = new File("/resources/upload/notice/" + path);
					delFile.delete();
				}
			}
		}
		return "redirect:/noticeDetail.do?noticeNo=" + n.getNoticeNo();
	}
```
```java
public int updateNotice(Notice n, int[] fileNoList) {
		int result = dao.updateNotice(n);
		
		if(result > 0) {
			
			// 추가한 파일이 있으면
			for(NoticeFile nf : n.getFileList()) {
				nf.setNoticeNo(n.getNoticeNo());
				result += dao.insertNoticeFile(nf);
			}
			
			// 삭제한 파일이 있다면
			if(fileNoList != null) {
				for(int fileNo : fileNoList) {
					result += dao.deleteNoticeFile(fileNo);
				}
			}
		}
		return result;
	}
```
#### 1-5. 글 삭제
- 파일을 조회하고 파일리스트가 null이 아니면 파일리스트데이터 제거, 없으면 공지사항만 제거
```java
// 게시물 리스트를 찾아오고 그 리스트를 받아와서 파일을 삭제한다
	@RequestMapping(value="/deleteNotice.do")
	public String deleteNotice(int noticeNo, HttpServletRequest request) {
		
		ArrayList<NoticeFile> list = service.selectNoticeFile(noticeNo);
		
		if(list != null) {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			for(NoticeFile nf : list) {
				File delFile = new File(path + nf.getFilepath());
				delFile.delete();
			}
		}
		return "redirect:/selectNoticeList.do?reqPage=1";
	}
```
```java
public ArrayList<NoticeFile> selectNoticeFile(int noticeNo) {
		ArrayList<NoticeFile> list = dao.selectALlNoticeFile(noticeNo);
		
		int result = 0;
		if(list != null) {
			result = dao.deleteNoticeFileList(noticeNo);
			if(result > 0) {
				result += dao.deleteNotice(noticeNo);
				}
				return list;
			}else {
				result = dao.deleteNotice(noticeNo);
				return null;
		}
		
	}
```
#### 1-6. 공지사항 검색
![image](https://user-images.githubusercontent.com/77394673/220703184-a3bf1abd-9943-45c6-aa49-03ca52e82d25.png)
- 제목, 내용, 제목 + 내용으로 검색
```html
<div class="notice-search">
            <form action="/searchNotice.do?reqPage=1" method="post">
                <select class="form-select form-select-lg mb-3" name="type" aria-label=".form-select-lg example" style="width: 150px; font-size: 18px; height: 60px; text-align: center;">
                    <option value="titleContent">제목 + 내용</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>

                <input class="w3-input w3-border w3-round-large" type="text" name="keyword" style="width: 500px; height: 60px; margin-left: 10px;" value="${keyword }">
                <button class="w3-button w3-round-large" id="searchBtn" style="width: 80px; height: 60px; background-color: rgb(33, 33, 33); color: white;margin-left: 10px;">
                    <span class="material-symbols-outlined">
                    search
                    </span></button>
            </form>
        </div>
```
```java
@RequestMapping(value="/searchNotice.do")
	public String searchNotice(String type, String keyword, int reqPage, Model model) {
		
		HashMap<String, Object> list = service.selectSearchNotice(type, keyword, reqPage);
		
		if(list == null) {
			model.addAttribute("msg", "검색어와 일치하는 내용이 없습니다.");
			return "notice/noticeList";
		}else {
			model.addAttribute("list", list.get("list"));
			model.addAttribute("pageNavi", list.get("pageNavi"));
			model.addAttribute("keyword", keyword);
			return "notice/noticeList";
		}
		
	}
```
```xml
<select id="selectSearchNotice" parameterType="map" resultType="n">
		select * from
			(select row_number() over (order by rnum desc) as rnum1, rb.* from
			(select rownum as rnum, b.* from
			(select 
		        notice_no as noticeNo,
		        notice_title as noticeTitle,
		        notice_writer as noticeWriter,
		        notice_content as noticeContent,
		        read_cnt as readCnt,
		        notice_date as noticeDate
        from notice_tbl order by noticeNo desc)b)rb order by 3 desc) where rnum between #{start} and #{end} and
        <choose>
        	<when test="type.equals('titleContent')">
        		noticeTitle like '%' || #{keyword} || '%' or noticeContent like '%' || #{keyword} || '%'
        	</when>
        	
        	<when test="type.equals('title')">
        		noticeTitle like '%' || #{keyword} || '%'
        	</when>
        	
        	<when test="type.equals('content')">
        		noticeContent like '%' || #{keyword} || '%'
        	</when>
        	
        </choose>
        
	</select>
```
