<?php
/**
 * Defines the HomePage page type
 */
 
class HomePage extends Page {
   private static $db = array(
      'Content1' => 'HTMLText',
      'Content2' => 'HTMLText',
      'Content3' => 'HTMLText',
      'Content4' => 'HTMLText',
     
   );
   private static $has_one = array(
 
   );

   private static $allowed_children = array('HomePageTab');
   
   public function getCMSFields() {
      $fields = parent::getCMSFields();
      
      $fields->removeByName('Content');
       	
      return $fields;
   }
}
 
class HomePage_Controller extends Page_Controller {
	public function Tabs(){
      return HomePageTab::get()->filter(array('ParentID' => $this->ID));
	}	
}




?>