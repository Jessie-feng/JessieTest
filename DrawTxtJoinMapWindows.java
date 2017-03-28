import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Scanner;
import java.util.regex.Pattern;



public class DrawTxtJoinMapWindows {


	public static void main(String[] args) throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

		String path = "C:\\GE_SVC_TB";
		String subfolder;

		FileWriter fwresult = new FileWriter(path + "\\" + "Result.csv");
		fwresult.write("\"" +"AccountingFlexfield" + "\",\""  +"Beginning" + "\",\""  +"Ending" + 
				"\",\"" +"Company Code" + "\",\"" + "Account Code" + "\",\"" + "Account Name"  + "\",\"" +"Center Code" + 
				"\",\""+ "Base Variable" + "\",\"" + "Modality Code" + "\",\"" + "Market Segment" +"\",\"" +
				"Folder" +"\",\"" + "Product Source" +"\",\"" + "Destination Code" +  "\"\n");


		//以下是转换txt为csv
		for(int i=1; i<=2; i++){
			if(i==1) {
				subfolder = "BOP";
			}
			else{
				subfolder = "EOP";
			}
			FileWriter fw = new FileWriter(path + "\\" + subfolder + "\\" + subfolder + "Output.csv");
			fw.write("\"" +"AccountingFlexfield" + "\",\""  +"BeginningBalance" +"\",\"" +"PeriodActivity" + "\",\"" + "EndingBalance" 
					+ "\",\"" +"Company" + "\",\"" + "Account_Code" + "\",\"" + "Description"  + "\",\"" +"Center" + 
					"\",\""+ "base_variable" + "\",\"" + "Modality" + "\",\"" + "market_segment" +"\",\"" +
					"folder" +"\",\"" + "product_source" +"\",\"" + "Destination" +  "\"\n");


			File dir = new File(path + "\\" + subfolder);
			File[] files = dir.listFiles(new filter("txt"));
			for(File file: files){
				Scanner input = new Scanner(file);
				while(input.hasNext()){
					String line = input.nextLine();

					if(Pattern.matches("\\s..\\d{7}.*", line)){
						
//					    String Account = line.substring(1, 11).trim();
						String Description = line.substring(11, 26).trim();
						String AccountingFlexfield = line.substring(26, 75).trim();
						String Company = AccountingFlexfield.substring(0,6).trim();
						String Account_Code = AccountingFlexfield.substring(7,16).trim();
						

//						if(Account_Code.length()>8 && (Integer.parseInt(Account_Code)) >=500000000 && (Integer.parseInt(Account_Code))<= 990000000){

							String Center = AccountingFlexfield.substring(17,23).trim();
							String base_variable = AccountingFlexfield.substring(24,25).trim();
							String Modality = AccountingFlexfield.substring(26,29).trim();
							String market_segment = AccountingFlexfield.substring(30,32).trim();
							String folder = AccountingFlexfield.substring(33,40).trim();
							String product_source = AccountingFlexfield.substring(41,45).trim();
							String Destination = AccountingFlexfield.substring(46).trim();

							String BeginningBalance = line.substring(75, 94).trim().replaceAll(",", "").replaceAll("\\(", "-").replaceAll("\\)","");
							String PeriodActivity = line.substring(94, 115).trim().replaceAll(",", "").replaceAll("\\(", "-").replaceAll("\\)","");
							String EndingBalance = line.substring(115).trim().replaceAll(",", "").replaceAll("\\(", "-").replaceAll("\\)","");


							fw.write("\"" + AccountingFlexfield + "\",\"" +  BeginningBalance +"\",\"" +PeriodActivity + "\",\"" + EndingBalance
									+"\",\"" + Company + "\",\"" + Account_Code + "\",\""+Description + "\",\""+Center + "\",\""+
									base_variable + "\",\"" + Modality + "\",\"" + market_segment +"\",\"" +
									folder +"\",\"" + product_source +"\",\"" + Destination + "\"\n");
//						}  、、if (Account_Code)) >=500000000 ....
					}


				}
				input.close();
			}
			fw.close( );

			String  msg=(i==1)? "translate BOP txt to csv is finished":"translate EOP txt to csv is finished";
			System.out.println(msg);
		}
		//以上是转换txt为csv

		//开始写到result.csv 
		//开始打印数据
		System.out.println("begin to generate Result.csv, please be patient");
		File bopfile = new File(path + "\\" + "BOP" + "\\" + "BOPoutput.csv");
		Scanner inputBOP = new Scanner(bopfile);
		
		
		OPtoArray eopclass = new OPtoArray(path + "\\" + "EOP" + "\\" + "EOPoutput.csv");
		String[][] eopArray = eopclass.opArray;

		//step1, 打印出bop里所有的行（包括eop里没有的行）
		String bopline = inputBOP.nextLine();
		
		String[] boplinearray;
		String bopline_AccountingFlexfield;
		String bopline_EndingBalance;
		String bopline_Company;
		String bopline_Account_Code;
		String bopline_Description;
		String bopline_Center;
		String bopline_base_variable;
		String bopline_Modality;
		String bopline_market_segment;
		String bopline_folder;
		String bopline_product_source;
		String bopline_Destination;
		String eoparray_AccountingFlexfield;
		String eoparray_EndingBalance;
		
		while(inputBOP.hasNext()){
			boolean checkbop = true;
			bopline = inputBOP.nextLine();  
			bopline =bopline.replaceAll("\"", "");
			boplinearray = bopline.split(",");

			bopline_AccountingFlexfield= boplinearray[0];
			bopline_EndingBalance= boplinearray[3];

			bopline_Company= boplinearray[4];
			bopline_Account_Code= boplinearray[5];
			bopline_Description= boplinearray[6];
			bopline_Center= boplinearray[7];
			bopline_base_variable= boplinearray[8];
			bopline_Modality= boplinearray[8];
			bopline_market_segment= boplinearray[10];
			bopline_folder= boplinearray[11];
			bopline_product_source= boplinearray[12];
			bopline_Destination= boplinearray[13];
			
			for(int i=0; i<eopArray.length; i++){
				eoparray_AccountingFlexfield= eopArray[i][0];
				eoparray_EndingBalance= eopArray[i][1];

				if((bopline_AccountingFlexfield.equals(eoparray_AccountingFlexfield)) == true){
					checkbop = false;
					fwresult.write("\"" + bopline_AccountingFlexfield + "\",\"" +  bopline_EndingBalance + "\",\"" + eoparray_EndingBalance +
							"\",\"" + bopline_Company + "\",\"" + bopline_Account_Code + "\",\""+bopline_Description + "\",\""
							+bopline_Center + "\",\""+ bopline_base_variable + "\",\"" + bopline_Modality + "\",\"" 
							+ bopline_market_segment +"\",\"" +
							bopline_folder +"\",\"" + bopline_product_source +"\",\"" +bopline_Destination + "\"\n");
					break;
				}
			}
			if(checkbop == true){		
				//打印出在BOP中有而EOP中没有的
				fwresult.write("\"" + bopline_AccountingFlexfield + "\",\"" +  bopline_EndingBalance + "\",\"" + 0 +
						"\",\"" + bopline_Company + "\",\"" + bopline_Account_Code + "\",\""+bopline_Description + "\",\""
						+bopline_Center + "\",\""+ bopline_base_variable + "\",\"" + bopline_Modality + "\",\"" 
						+ bopline_market_segment +"\",\"" +
						bopline_folder +"\",\"" + bopline_product_source +"\",\"" +bopline_Destination + "\"\n");
			}
		}
		inputBOP.close();

		System.out.println("Result.csv part1 is done, going to generate part2 ");
	
		//step2, 打印出不在bop 但在eop里的行
		File eopfile = new File(path + "\\" + "EOP" + "\\" + "EOPoutput.csv");
		Scanner inputEOP = new Scanner(eopfile);
		OPtoArray bopclass = new OPtoArray(path + "\\" + "BOP" + "\\" + "BOPoutput.csv");
		String[][] boparray = bopclass.opArray;
		
		String eopline = inputEOP.nextLine();
		String[] eoplinearray;
		
		String eopline_AccountingFlexfield;
		String eopline_EndingBalance;
		String eopline_Company;
		String eopline_Account_Code;
		String eopline_Description;
		String eopline_Center;
		String eopline_base_variable;
		String eopline_Modality;
		String eopline_market_segment;
		String eopline_folder;
		String eopline_product_source;
		String eopline_Destination;

		String boparray_AccountingFlexfield;
		String boparray_EndingBalance;

		
		while(inputEOP.hasNext()){
			boolean enotb = true;
			eopline = inputEOP.nextLine();  
			eopline =eopline.replaceAll("\"", "");
			eoplinearray = eopline.split(",");

			eopline_AccountingFlexfield= eoplinearray[0];
			eopline_EndingBalance= eoplinearray[3];

			eopline_Company= eoplinearray[4];
			eopline_Account_Code= eoplinearray[5];
			eopline_Description= eoplinearray[6];
			eopline_Center= eoplinearray[7];
			eopline_base_variable= eoplinearray[8];
			eopline_Modality= eoplinearray[8];
			eopline_market_segment= eoplinearray[10];
			eopline_folder= eoplinearray[11];
			eopline_product_source= eoplinearray[12];
			eopline_Destination= eoplinearray[13];
			
			
			for(int i = 0; i<boparray.length; i++){
				boparray_AccountingFlexfield= boparray[i][0];
				boparray_EndingBalance= boparray[i][1];
				if((boparray_AccountingFlexfield.equals(eopline_AccountingFlexfield))== true ){
					enotb =false;
					break;
				}
			}
			if (enotb == true){
				fwresult.write("\"" + eopline_AccountingFlexfield + "\",\"" +  0 + "\",\"" + eopline_EndingBalance +
						"\",\"" + eopline_Company + "\",\"" + eopline_Account_Code + "\",\""+eopline_Description + "\",\""
						+eopline_Center + "\",\""+ eopline_base_variable + "\",\"" + eopline_Modality + "\",\"" 
						+ eopline_market_segment +"\",\"" +
						eopline_folder +"\",\"" + eopline_product_source +"\",\"" +eopline_Destination + "\"\n");
			}
		}
		inputEOP.close();
		fwresult.close();
		
		System.out.println("Result.csv is completely done, going to generate ResultWithMap.csv");
		
	//now begin to map the for columns
		String pathRegion = path + "\\" + "maptables" + "\\" + "CC_0828_Region.csv";
		String pathChannel = path + "\\" + "maptables" + "\\" + "CC_0828_Channel.csv";
		String pathAccount = path + "\\" + "maptables" + "\\" + "Account.csv";
		String pathOP2014 = path + "\\" + "maptables" + "\\" + "P80400_OP.csv";
		

		FileWriter resultwithmap = new FileWriter(path + "\\" + "ResultWithMap.csv");
		resultwithmap.write("\"" +"AccountingFlexfield" + "\",\""  +"Beginning" + "\",\""  +"Ending" + 
				"\",\"" +"Company Code" + "\",\"" + "Account Code" + "\",\"" + "Account Name"  + "\",\"" +"Center Code" + 
				"\",\""+ "Base Variable" + "\",\"" + "Modality Code" + "\",\"" + "Market Segment" +"\",\"" +
				"Folder" +"\",\"" + "Product Source" +"\",\"" + "Destination Code" +  "\",\"" + "Region" +
				"\",\"" + "Channel" + "\",\"" + "Sub-category" + "\",\"" + "2014_OP" +"\"\n");
		
		File fileresult = new File(path + "\\" + "Result.csv");
		Scanner resultinput = new Scanner(fileresult);
		String[][] RegionArray = new mapToArray(pathRegion).mapArray;
		String[][] ChannelArray = new mapToArray(pathChannel).mapArray;
		String[][] AccountArray = new mapToArray(pathAccount).mapArray;
		String[][] OP2014Array = new mapToArray(pathOP2014).mapArray;
		String[] resultarray;
		String Region, Channel, Account, OP2014;
		boolean foundRegion =false;
		boolean foundChannel =false;
		boolean foundAccount =false;
		boolean foundOP2014 =false;
		String Costcenter;
		String Accountcode;
		

		String resultline = resultinput.nextLine();
		while(resultinput.hasNext()){
			foundRegion =false;
			foundChannel =false;
			foundAccount =false;
			foundOP2014 =false;
			
			resultline = resultinput.nextLine();
			resultarray = resultline.split(",");
			Costcenter = resultarray[6].trim().replaceAll("\"","");
			Accountcode = resultarray[4].trim().replaceAll("\"","");
			
			//Region
			for(int i=0; i<RegionArray.length; i++){
				if(Costcenter.equals(RegionArray[i][0].trim()) ){
					Region = RegionArray[i][1].trim();
					foundRegion = true;
					resultline = resultline + ",\""  + Region + "\"";
					break;
				}
			}
			if(foundRegion == false){
				resultline = resultline + ",\""  + "" + "\"";
			}
			
			//Channel
			for(int i=0; i<ChannelArray.length; i++){
				if(Costcenter.equals(ChannelArray[i][0].trim()) ){
					Channel = ChannelArray[i][1].trim();
					foundChannel = true;
					resultline = resultline + ",\""  + Channel + "\"";
					break;
				}
			}
			if(foundChannel == false){
				resultline = resultline + ",\""  + "" + "\"";
			}
		
			
			//Account
			for(int i=0; i<AccountArray.length; i++){
				if(Accountcode.equals(AccountArray[i][0].trim()) ){
					Account = AccountArray[i][1].trim();
					foundAccount = true;
					resultline = resultline + ",\""  + Account + "\"";
					break;
				}
			}
			if(foundAccount == false){
				resultline = resultline + ",\""  + "" + "\"";
			}
			
			//2014OP
			for(int i=0; i<OP2014Array.length; i++){
				if(Costcenter.equals(OP2014Array[i][0].trim()) ){
					OP2014 = OP2014Array[i][1].trim();
					foundOP2014 = true;
					resultline = resultline + ",\""  + OP2014 + "\"";
					break;
				}
			}
			if(foundOP2014 == false){
				resultline = resultline + ",\""  + "" + "\"";
			}
			
			resultwithmap.write(resultline + "\n");
		}
		
		resultinput.close();
		resultwithmap.close();
		System.out.println("CONGRATUATIONS, ResultWithMap.csv is finished");
		
		File donetxt = new File(path + "\\" + "done.txt");
		PrintWriter done = new PrintWriter(donetxt);
		done.write("test");
		done.close();

		
		
	}
}



class filter implements FilenameFilter{
	String extension = ".";
	public filter(String fileExtensionNoDot)
	{
		extension += fileExtensionNoDot;
	}
	public boolean accept(File dir, String name)
	{
		return name.endsWith(extension);
	}
}


class mapToArray{
	
	public static String[][] mapArray;
	private String path;

	public mapToArray(String s) throws FileNotFoundException{ 
		this.path = s;
		mapArray = arraryfunciton(s);
	}
	
	String[][] arraryfunciton(String filename) throws FileNotFoundException{
		int i=0;
		int j=0;
		
		Scanner input = new Scanner(new File(filename));
		while(input.hasNext()){
			j++;
			input.nextLine();
		}
		String[][] innerarray = new String[j-1][2];
		input.close();
		
		Scanner input2 = new Scanner(new File(filename));
		String line = input2.nextLine();
		while(input2.hasNext()){
			line = input2.nextLine();  
			String[] boplinearray = line.split(",");

			innerarray[i][0] = boplinearray[0];  
			innerarray[i][1] = boplinearray[1]; 
			i++;
		}
		input2.close();
		
		return innerarray;
	}
}

class OPtoArray{
	
	public static String[][] opArray;
	private String path;

	public OPtoArray(String s) throws FileNotFoundException{ 
		this.path = s;
		opArray = arraryfunciton(s);
	}
	
	String[][] arraryfunciton(String filename) throws FileNotFoundException{
		int i=0;
		int j=0;
		
		Scanner input = new Scanner(new File(filename));
		while(input.hasNext()){
			j++;
			input.nextLine();
		}
		String[][] innerarray = new String[j-1][2];
		input.close();
		
		Scanner input2 = new Scanner(new File(filename));
		String line = input2.nextLine();
		while(input2.hasNext()){
			line = input2.nextLine();  
			line =line.replaceAll("\"", "");
			String[] boplinearray = line.split(",");

			innerarray[i][0] = boplinearray[0];  
			innerarray[i][1] = boplinearray[3]; 
			i++;
		}
		input2.close();
		
		return innerarray;
	}
}


