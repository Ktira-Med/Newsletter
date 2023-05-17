<?php 
namespace App\Model;

use App\Core\AbstractModel;
use App\Entity\Origine;

class OrigineModel extends AbstractModel{


function getAllOrigins()
{
    // Construction du Data Source Name
    
    
    $sql = 'SELECT *
            FROM origine
            ORDER BY origine_label';

    $results=$this->db->getAllResults($sql); 
    $origins=[];
    foreach ($results as $result) {
        // $origin = new Origine($result);
        // $origins[] = $origin;
        $origins[]=new Origine($result);
    }

    return $origins;
   
}
}