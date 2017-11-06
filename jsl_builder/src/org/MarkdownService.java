package org;

import static jodd.jerry.Jerry.jerry;
import jodd.jerry.Jerry;
import org.pegdown.Parser;
import org.pegdown.PegDownProcessor;

import com.overzealous.remark.Remark;

import jolie.runtime.JavaService;


public class MarkdownService extends JavaService{
	
	private static final PegDownProcessor proc = new PegDownProcessor( Parser.ABBREVIATIONS +
						Parser.AUTOLINKS + Parser.DEFINITIONS +
						Parser.HARDWRAPS + Parser.TABLES + 
						Parser.FENCED_CODE_BLOCKS +
						Parser.STRIKETHROUGH );
  private static final Remark remark = new Remark();
	
	public String markdownToHtml( String text ) {
		Jerry doc = jerry( proc.markdownToHtml( text ) );
    for( Jerry node: doc.$( "h1,h2,h3,h4,h5" ) ){
    	String id = node.text().toLowerCase()
    		.replaceAll("[^a-zA-Z0-9 -]" , "").replaceAll( " ", "-" );
			node.attr( "id", id );
    }
    return doc.html();
	}

  public String htmlToMarkdown( String text ) {
    return remark.convert( text );
  }
	
}