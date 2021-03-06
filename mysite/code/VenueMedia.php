<?php

use SilverStripe\Assets\Image;
use SilverStripe\Forms\TextField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\ORM\DataObject;

class VenueMedia extends DataObject {
	private static $db = array(
		'Title'      => 'Varchar(155)',
		'MediaEmbed' => 'HTMLText',
		'Content'    => 'HTMLText',
		'SortOrder'  => 'Int',
		'PhotoCredit' => 'Text',

	);

	private static $has_one = array(
		'Image' => Image::class,
		'Venue' => 'VenuePage',
	);

	private static $summary_fields = array('Title', 'MediaEmbed', 'Image.CMSThumbnail');

	private static $default_sort = 'SortOrder';

	public function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeByName('SortOrder');
		$fields->addFieldToTab('Root.Main', new TextField('Title'));
		$fields->addFieldToTab('Root.Main', new TextField('MediaEmbed'));
		$fields->addFieldToTab('Root.Main', new TextField('PhotoCredit'));
		$fields->addFieldToTab('Root.Main', new UploadField(Image::class));
		$fields->addFieldToTab('Root.Main', new HTMLEditorField('Content'));

		return $fields;

	}

}