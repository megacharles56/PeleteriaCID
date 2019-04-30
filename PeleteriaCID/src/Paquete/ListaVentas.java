/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Gloria
 */
public class ListaVentas extends javax.swing.JFrame {

    /**
     * Creates new form ListaVentas
     */
    public ListaVentas() {
        initComponents();
        DefaultTableModel modelo=new DefaultTableModel();
        modelo.addColumn("ID");
        modelo.addColumn("Fecha");
        modelo.addColumn("Metodo de pago");
        modelo.addColumn("Total");
        tblCortes.setModel(modelo);
        String sql;
        ResultSet rs;
        Statement st;
        String[] datos=new String[4];
        
            sql="SELECT *"
                    + " FROM peleteriacid.pedidos;";
        try {
            Format formatter = new SimpleDateFormat("yyyy-MM-dd");
            st=cn.createStatement();
            rs=st.executeQuery(sql);
            System.out.println(sql);
            while (rs.next()){
                datos[0]=String.valueOf(rs.getInt(1));
                datos[1]=formatter.format(rs.getDate(3));
                datos[2]=rs.getString(4);
                datos[3]=String.valueOf(rs.getDouble(2));
                
                modelo.addRow(datos);
            }
            tblCortes.setModel(modelo);
            rs.close();
            
        }catch(SQLException ex){
            Logger.getLogger(ListarMateriales.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPopupMenu1 = new javax.swing.JPopupMenu();
        info = new javax.swing.JMenuItem();
        btnListar = new javax.swing.JButton();
        dateFecha = new com.toedter.calendar.JDateChooser();
        jLabel1 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCortes = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblMateriales = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();

        info.setText("Mas información...");
        info.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                infoActionPerformed(evt);
            }
        });
        jPopupMenu1.add(info);

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnListar.setText("Listar");
        btnListar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnListarActionPerformed(evt);
            }
        });

        jLabel1.setText("Escoja una fecha:");

        jLabel9.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(0, 102, 204));
        jLabel9.setText("LISTA DE VENTAS");

        tblCortes.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        tblCortes.setComponentPopupMenu(jPopupMenu1);
        jScrollPane1.setViewportView(tblCortes);

        tblMateriales.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(tblMateriales);

        jLabel2.setText("Materiales:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 471, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(29, 29, 29)
                        .addComponent(dateFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 159, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(60, 60, 60)
                        .addComponent(btnListar)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 131, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel9)
                .addGap(435, 435, 435))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel9)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(15, 15, 15)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addComponent(dateFecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel1))
                            .addComponent(btnListar))
                        .addGap(18, 18, 18))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2)
                        .addGap(8, 8, 8)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 496, Short.MAX_VALUE)
                    .addComponent(jScrollPane1))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnListarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnListarActionPerformed
        Format formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fecha=formatter.format(dateFecha.getDate());
        System.out.println(fecha);
        ResultSet rs;
        Statement st;
        String[] datos=new String[4];
        DefaultTableModel modelo=new DefaultTableModel();
        modelo.addColumn("ID");
        modelo.addColumn("Fecha");
        modelo.addColumn("Metodo de pago");
        modelo.addColumn("Total");
        tblCortes.setModel(modelo);
        try{
            String sql=("SELECT * FROM peleteriacid.pedidos "
                +"WHERE PEDIDO_FECHA = '"+fecha+"';");
            st=cn.createStatement();
            rs=st.executeQuery(sql);
               System.out.println(sql);
            while (rs.next()){
                datos[0]=String.valueOf(rs.getInt(1));
                datos[1]=formatter.format(rs.getDate(3));
                datos[2]=rs.getString(4);
                datos[3]=String.valueOf(rs.getDouble(2));
                modelo.addRow(datos);
            }
            tblCortes.setModel(modelo);
            rs.close();
        }catch(SQLException ex){
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnListarActionPerformed

    private void infoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_infoActionPerformed
        int row=tblCortes.getSelectedRow();
        if(row>=0){
            int ID=Integer.parseInt(tblCortes.getValueAt(row, 0).toString());
            ResultSet rs;
            Statement st;
            int Materia=0, Cantidad=0;
            double Total=0.0, Ganancia=0.0;
            DefaultTableModel modelito=new DefaultTableModel();
            modelito.addColumn("SKU");
            modelito.addColumn("Tipo");
            modelito.addColumn("Modelo");
            modelito.addColumn("Color");
            modelito.addColumn("Cantidad vendida");
            modelito.addColumn("Total");
            modelito.addColumn("Ganancia");
            tblMateriales.setModel(modelito);
            try{
            String sql=("SELECT * FROM peleteriacid.materiales_has_pedidos "
                +"WHERE PEDIDO_ID = '"+ID+"';");
            
            st=cn.createStatement();
            rs=st.executeQuery(sql);
            String[] datos=new String[7];
            while (rs.next()){
                Materia=rs.getInt(2);
                Cantidad=rs.getInt(3);
                Total=(rs.getDouble(4));
                Ganancia=(rs.getDouble(5));
                String sql2="SELECT MATERIA_SKU, MATERIA_TIPO, MATERIA_MODELO, MATERIA_COLOR FROM peleteriacid.materiales WHERE MATERIA_ID = "+Materia+";";
                ResultSet rs2;
                Statement st2;
                
                    st2=cn.createStatement();
                    rs2=st2.executeQuery(sql2);
                    while (rs2.next()){
                        datos[0]=rs2.getString(1);
                        datos[1]=rs2.getString(2);
                        datos[2]=rs2.getString(3);
                        datos[3]=rs2.getString(4);
                        datos[4]=String.valueOf(Cantidad);
                        datos[5]=String.valueOf(Total);
                        datos[6]=String.valueOf(Ganancia);
                        modelito.addRow(datos);
                    }
                    rs2.close();
                    tblMateriales.setModel(modelito);
            }
            rs.close();
        }catch(SQLException ex){
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
        }else{
            JOptionPane.showMessageDialog(null, "No seleccionó ninguna fila");
        }
    }//GEN-LAST:event_infoActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ListaVentas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ListaVentas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ListaVentas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ListaVentas.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ListaVentas().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnListar;
    private com.toedter.calendar.JDateChooser dateFecha;
    private javax.swing.JMenuItem info;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPopupMenu jPopupMenu1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblCortes;
    private javax.swing.JTable tblMateriales;
    // End of variables declaration//GEN-END:variables
Conectar cc=new Conectar();
Connection cn=cc.conexion();
}