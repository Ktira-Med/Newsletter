<?php 
namespace App\Entity;

class Origine{

    private int $id;
    private string $origine_label;


    public function __construct(array $data = [])
    {
        foreach ($data as $propertyName => $value) {
            $setter = 'set' . ucfirst($propertyName);
            if (method_exists($this, $setter)) {
                $this->$setter($value);
            }
        }
    }

    /**
     * Get the value of id
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     */
    public function setId(int $id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of origine_label
     */
    public function getOrigine_label(): string
    {
        return $this->origine_label;
    }

    /**
     * Set the value of origine_label
     */
    public function setOrigine_label(string $origine_label): self
    {
        $this->origine_label = $origine_label;

        return $this;
    }
    }