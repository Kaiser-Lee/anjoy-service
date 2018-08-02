package com.base.common.tool;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

public class MybitsGenerator {
	public void generator() throws Exception{  
		  
		  
        List<String> warnings = new ArrayList<String>();  
        boolean overwrite = true;  
        //加载配置文件  D:\workspace\jgh_mall\src\main\resources
        File configFile = new File("D:\\eclipse-workspace\\bootdo\\src\\main\\resources\\mybatis-generator.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings); 
        Configuration config = cp.parseConfiguration(configFile);  
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);  
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,  
                callback, warnings);  
        myBatisGenerator.generate(null);
  
  
    }   
    public static void main(String[] args) throws Exception {  
        try {  
        	MybitsGenerator generatorSqlmap = new MybitsGenerator();  
            generatorSqlmap.generator();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
          
    }
}
