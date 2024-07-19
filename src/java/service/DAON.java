/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import db.ConexionSingleton;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.CRUD;
import model.N;

/**
 *
 * @author Ethan
 */
public class DAON implements CRUD<N>{
    private ConexionSingleton oConexion;
    
    public DAON (ConexionSingleton oConexion){
        this.oConexion= oConexion;
    }
    
    @Override
    public void insert (N obj) {
        String sql = "INSERT INTO db VALUES(NULL,'"+ obj.getA()+ "','" + obj.getB()+ "','" + obj.getC()+ "')";
        try {
            oConexion.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(N obj) {
        String sql = "DELETE FROM db WHERE id = '" + obj.getId()+ "'";
        try {
            oConexion.getConnection().createStatement().execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<N> get(int id) {
        String sql = "SELECT * FROM db WHERE id = '" + id + "'";
        try {
            ResultSet oResultSet = oConexion.getConnection().createStatement().executeQuery(sql);
            if (oResultSet.next()) {
                return Optional.of(new N(oResultSet.getInt("id"), oResultSet.getString("a"), oResultSet.getString("b"), oResultSet.getString("c")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void update(N obj) {
        String sql = "UPDATE db set a='" + obj.getA()+ "', b ='" + obj.getB()+ "', c='" + obj.getC()+ "' WHERE id='"+ obj.getId()+ "'";
        try {
           oConexion.getConnection().createStatement().execute(sql); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Optional<List<N>> getAll() {
        String sql= "SELECT * FROM db";
        List<N> list =new ArrayList<>();
        try {
            ResultSet oResultSet = oConexion.getConnection().createStatement().executeQuery(sql);
            while (oResultSet.next()) {
                list.add(new N (oResultSet.getInt("id"), oResultSet.getString("a"), oResultSet.getString("b"), oResultSet.getString("c")));
            }
            return Optional.of(list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }    
}
