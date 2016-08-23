package br.ufsm.csi.apachePOI;

import java.io.File;
import java.io.FileOutputStream;
import java.text.NumberFormat;
import java.util.ArrayList;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import br.ufsm.csi.model.Demanda;
import br.ufsm.csi.model.Projeto;

public class CriaExcel {

	XSSFWorkbook workbook = new XSSFWorkbook();
	XSSFCell cell;
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	boolean status = false;
	
	public boolean criar (Projeto projeto, ArrayList<Demanda> itens){
		
		// "//opt//tomcat//webapps//ProjetoPolitecnico//WEB-INF//classes//projetos"
		// "C:\\Users\\Jr\\workspace\\ProjetoPolitecnico\\src\\main\\resources\\projetos"
		String diretorio = "//opt//tomcat//webapps//ProjetoPolitecnico//WEB-INF//classes//projetos";
		// "\\" +"Projeto " +projeto.getModalidade() +" - " +projeto.getNumeroProjeto() +".xlsx"
		diretorio += "//" +"Projeto " +projeto.getModalidade() +" - " +projeto.getNumeroProjeto() +".xlsx";

		FileOutputStream file = null;

		try{
			file = new FileOutputStream(new File(diretorio));
			
			abaDemanda(itens);
			abaProjeto(projeto);
			
			workbook.write(file);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				file.flush();
				file.close();
				
				status = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return status;
	}
	
	private void abaDemanda(ArrayList<Demanda> itens) {
		
		XSSFSheet abaDemanda = workbook.createSheet("DEMANDAS");
		abaDemanda.protectSheet("1234");
		
		XSSFRow row = abaDemanda.createRow(0);  // cabeçalho
		
		XSSFCellStyle header = workbook.createCellStyle();
		// alinhamento
		header.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		// cores
		header.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		header.setFillPattern(CellStyle.SOLID_FOREGROUND);
		// bordas
        header.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        header.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        header.setBorderRight(XSSFCellStyle.BORDER_THIN);
        header.setBorderTop(XSSFCellStyle.BORDER_THIN);
				
		cell = row.createCell(0);
		cell.setCellValue("DEMANDA");
        cell.setCellStyle(header);
		
		cell = row.createCell(1);
		cell.setCellValue("CÓDIGO");
        cell.setCellStyle(header);
		
		cell = row.createCell(2);
		cell.setCellValue("DESCRIÇÃO");
        cell.setCellStyle(header);
		
		cell = row.createCell(3);
		cell.setCellValue("UNID. MEDIDA");
        cell.setCellStyle(header);
		
		cell = row.createCell(4);
		cell.setCellValue("VALOR UNIT.");
        cell.setCellStyle(header);
        
		cell = row.createCell(5);
		cell.setCellValue("QUANT.");
        cell.setCellStyle(header);
        
		cell = row.createCell(6);
		cell.setCellValue("VALOR TOTAL");
        cell.setCellStyle(header);
        
		cell = row.createCell(7);
		cell.setCellValue("PERIODO");
        cell.setCellStyle(header);
        
		cell = row.createCell(8);
		cell.setCellValue("JUSTIFICATIVA");
        cell.setCellStyle(header);
		
        for(int i=0; i<9; i++)
        	abaDemanda.autoSizeColumn(i);
        
        XSSFCellStyle body = workbook.createCellStyle();
		// alinhamento
		body.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		// cores
		body.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		body.setFillPattern(CellStyle.SOLID_FOREGROUND);
		// bordas
        body.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        body.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        body.setBorderRight(XSSFCellStyle.BORDER_THIN);
        body.setBorderTop(XSSFCellStyle.BORDER_THIN);
        
        for(int i=0; i<itens.size(); i++){
        	
        	row = abaDemanda.createRow(i+1);
        	
    		cell = row.createCell(0);
    		cell.setCellValue(itens.get(i).getDemanda());
            cell.setCellStyle(body);
    		
    		cell = row.createCell(1);
    		cell.setCellValue(itens.get(i).getCodigoDemanda());
            cell.setCellStyle(body);
    		
    		cell = row.createCell(2);
    		cell.setCellValue(itens.get(i).getDescricao());
            cell.setCellStyle(body);
    		
    		cell = row.createCell(3);
    		cell.setCellValue(itens.get(i).getUnidadeMedida());
            cell.setCellStyle(body);
    		
    		cell = row.createCell(4);
    		cell.setCellValue(nf.format(itens.get(i).getValorUnitario()));
            cell.setCellStyle(body);
            
    		cell = row.createCell(5);
    		cell.setCellValue(itens.get(i).getQuantidade());
            cell.setCellStyle(body);
            
    		cell = row.createCell(6);
    		cell.setCellValue(nf.format(itens.get(i).getValorTotal()));
            cell.setCellStyle(body);
            
    		cell = row.createCell(7);
    		cell.setCellValue(itens.get(i).getPeriodo());
            cell.setCellStyle(body);
            
    		cell = row.createCell(8);
    		cell.setCellValue(itens.get(i).getJustificativa());
            cell.setCellStyle(body);
            
            for(int j=0; j<9; j++)
            	abaDemanda.autoSizeColumn(j);
        }
	}

	public void abaProjeto (Projeto projeto){
		
		XSSFSheet abaProjeto = workbook.createSheet("PROJETO");
		abaProjeto.protectSheet("1234");
		
		XSSFRow row = abaProjeto.createRow(0);  // cabeçalho
		
		XSSFCellStyle header = workbook.createCellStyle();
		// alinhamento
		header.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		// cores
		header.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		header.setFillPattern(CellStyle.SOLID_FOREGROUND);
		// bordas
        header.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        header.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        header.setBorderRight(XSSFCellStyle.BORDER_THIN);
        header.setBorderTop(XSSFCellStyle.BORDER_THIN);
				
		cell = row.createCell(0);
		cell.setCellValue("SIAPE");
        cell.setCellStyle(header);
		
		cell = row.createCell(1);
		cell.setCellValue("PROPONENTE");
        cell.setCellStyle(header);
		
		cell = row.createCell(2);
		cell.setCellValue("MODALIDADE");
        cell.setCellStyle(header);
		
		cell = row.createCell(3);
		cell.setCellValue("NÚMERO");
        cell.setCellStyle(header);
		
		cell = row.createCell(4);
		cell.setCellValue("NOME DO PROJETO");
        cell.setCellStyle(header);
		
        for(int i=0; i<5; i++)
        	abaProjeto.autoSizeColumn(i);
		
		row = abaProjeto.createRow(1);
		
		XSSFCellStyle body = workbook.createCellStyle();
		// alinhamento
		body.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		// cores
		body.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
		body.setFillPattern(CellStyle.SOLID_FOREGROUND);
		// bordas
        body.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        body.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        body.setBorderRight(XSSFCellStyle.BORDER_THIN);
        body.setBorderTop(XSSFCellStyle.BORDER_THIN);
		
		cell = row.createCell(0);
		cell.setCellValue(projeto.getSiape());           
        cell.setCellStyle(body);
		
		cell = row.createCell(1);
		cell.setCellValue(projeto.getProponente());
        cell.setCellStyle(body);

		cell = row.createCell(2);
		cell.setCellValue(projeto.getModalidade());
        cell.setCellStyle(body);
        
		cell = row.createCell(3);
		cell.setCellValue(projeto.getNumeroProjeto());
        cell.setCellStyle(body);
		
		cell = row.createCell(4);
		cell.setCellValue(projeto.getNomeProjeto());
        cell.setCellStyle(body);
		
        for(int i=0; i<5; i++)
        	abaProjeto.autoSizeColumn(i);
	}
}
