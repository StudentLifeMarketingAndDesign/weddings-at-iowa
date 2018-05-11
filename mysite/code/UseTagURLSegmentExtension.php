<?php

use SilverStripe\View\Parsers\URLSegmentFilter;
use SilverStripe\ORM\DataList;
use SilverStripe\ORM\DataExtension;

/**
 * Adds URLSegment functionality to Tags & Categories.
 *
 * @package silverstripe
 * @subpackage blog
 */
class UseTagURLSegmentExtension extends DataExtension {
	/**
	 * @var array
	 */
	private static $db = array(
		'URLSegment' => 'Varchar(255)',
	);

	/**
	 * {@inheritdoc}
	 */
	public function onBeforeWrite() {
		$this->owner->generateURLSegment();
	}

	/**
	 * Generates a unique URLSegment from the title.
	 *
	 * @param int $increment
	 *
	 * @return string
	 */
	public function generateURLSegment($increment = null) {
		$filter = new URLSegmentFilter();

		$this->owner->URLSegment = $filter->filter($this->owner->Title);

		if (is_int($increment)) {
			$this->owner->URLSegment .= '-'.$increment;
		}

		$duplicate = DataList::create($this->owner->ClassName)->filter(array(
				'URLSegment' => $this->owner->URLSegment
			));

		if ($this->owner->ID) {
			$duplicate = $duplicate->exclude('ID', $this->owner->ID);
		}

		if ($duplicate->count() > 0) {
			if (is_int($increment)) {
				$increment += 1;
			} else {
				$increment = 0;
			}

			$this->owner->generateURLSegment((int) $increment);
		}

		return $this->owner->URLSegment;
	}
}