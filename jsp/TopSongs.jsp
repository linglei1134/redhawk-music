<%-- CPS 595 Final project: Lei Ling, Jorge Nieto, Pinxia Ye --%>
<%! String title = "RedHawk Music - Top Songs";%>
<%@ include file="../global/header.jsp"%>
<%@ include file="../global/left.jsp"%>

<%!
	Catalog newCatalog = null;
%>

<%
	ServletContext sc = getServletContext();

    String path = sc.getRealPath("/catalog/catalog.ser");

	try
	{
		newCatalog = DeserializeCatalog.deserialize(newCatalog, path);	
	}
	
	catch(IOException ioe)
	{
		System.out.println(ioe.getMessage());
	}

	List<Song> songs = new ArrayList<Song>();
	
	songs = newCatalog.getSortedSongsbyDownload();
		
%>
	


<%-- Begin Content --%>

		<div class="grid">
					
			<h2>Top Songs</a></h2>
			<ul class="image-grid">
				<%
				for (int i=0; i<songs.size(); i++)
				{
					if (songs.get(i).getNumberDownloads() != 0) 
					{
					%>
					<li>
					<a href="item.jsp?song=<%=songs.get(i).getidS()%>"><div class="small">
					<img src= "<%=songs.get(i).getImagePath()%>" title="<%=songs.get(i).getSname()%>" /></div></a>
					</li>
					<%
					}
				}
				%>
			</ul>
			<h4><a href="ChartPage.jsp">go back..</a></h4>
		</div>
		
		
<%-- End Content --%>

<%@ include file="../global/footer.jsp"%>