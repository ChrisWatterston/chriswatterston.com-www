<?php
namespace Concrete\Block\ExternalForm\Form\Controller;

use Concrete\Core\Controller\AbstractController;

class LandingForm extends AbstractController
{
    public function action_landing_search($bID = false)
    {
        if ($this->bID == $bID) {
            $this->set('response', t('Thanks!'));

            return true;
        }
    }
}
