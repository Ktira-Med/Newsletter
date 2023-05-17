<?php

namespace App\Model;

use App\Core\AbstractModel;
use App\Entity\Interest;

class InterestModel extends AbstractModel
{
   
    function getAllInterests()
    {
        $sql = 'SELECT *
            FROM interest
            ORDER BY interest_label';

        $results = $this->db->getAllResults($sql);

        $interests  = [];
        foreach ($results as $result) {
            // $interest = new Interest($result);
            // $interests[] = $interest;
            $interests[]=new Interest($result);
        }

        return $interests;
    }

    function addInterestForSubscriber(int $userID, int $interestID)
    {

        // Insertion  dans la table fill_interest
        $sql = 'INSERT INTO fill_interest
            (subscriber_id , interest_id) 
            VALUES (?,?)';

        $this->db->prepareAndExecute($sql,[$userID,$interestID]);
    }
}