package com.luyi.umusic.service.impl;

import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import com.luyi.umusic.model.Music;

public class ComparatorUser implements Comparator{

 public int compare(Object arg0, Object arg1) {
	 Music user0=(Music)arg0;
	 Music user1=(Music)arg1;

   //首先比较年龄，如果年龄相同，则比较名字

  int flag=user0.getFeedbackCount().compareTo(user1.getFeedbackCount());
  if(flag==0){
   return user0.getReadedCount().compareTo(user1.getReadedCount());
  }else{
   return flag;
  }  
 }
 
}
