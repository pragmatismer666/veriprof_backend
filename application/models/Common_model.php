<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Common_model extends CI_Model
{
    public function __construct()
    {
        
    }

    public function save($table, $data = [])
    {

        $builder = $this->db->table($table);
        return  $builder->insert($data);
    }

    public function save_return_id($table, $data = [])
    {
        $builder = $this->db->table($table);
        $builder->insert($data);
        return $this->db->insertID();
    }

    public function update($table, $data, $where = array())
    {
        return $resutl = $this->db->table($table)
            ->set($data)
            ->where($where)
            ->update();
    }

    public function delete($table, $where = array())
    {
        return $resutl = $this->db->table($table)
            ->where($where)
            ->delete();
    }

    public function findById($table, $where = array())
    {
        return $resutl = $this->db->table($table)
            ->where($where)
            ->get()
            ->getRow();
    }

    public function read($table, $where = array(), $limit = null, $offset = null)
    {
        $builder = $this->db->table($table);
        return $builder->select("*")
            ->where($where)
            ->limit($limit, $offset)
            ->get()
            ->getRow();
    }

    public function countRow($table, $where = array(), $groupBy = '')
    {
        return $resutl = $this->db->table($table)
            ->where($where)
            ->groupBy($groupBy)
            ->countAllResults();
    }

    public function findAllGroupBy($table, $where = array(), $groupBy = null, $serialized = null, $order = null)
    {
        $builder = $this->db->table($table);
        $builder->select('*');
        $builder->where($where);
        $builder->groupBy($groupBy);
        $builder->orderBy($serialized, $order);
        $query = $builder->get();
        return $data = $query->getResult();
    }

    public function findAll($table, $where = array(), $serialized = null, $order = null)
    {
        $builder = $this->db->table($table);
        $builder->select('*');
        $builder->where($where);
        $builder->orderBy($serialized, $order);
        $query = $builder->get();
        return $data = $query->getResult();
    }

    public function get_all($table, $where = array(), $serialized = null, $order = null, $limit = 0, $offset = 0, $groupBy = '')
    {

        $builder = $this->db->table($table);
        $builder->select('*');
        $builder->where($where);
        $builder->limit($limit, $offset);
        $builder->groupBy($groupBy);
        $builder->orderBy($serialized, $order);
        $query = $builder->get();
        return $data = $query->getResult();
    }
}

  