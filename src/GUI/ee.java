/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.util.UUID;
import net.sf.jasperreports.engine.util.DigestUtils;

/**
 *
 * @author abhi
 */
public class ee {

    public static void main(String[] args) {
        String uniqueKey = UUID.randomUUID().toString();

        String[] split = uniqueKey.split("-");

        System.out.println(new ee().getPassword());

    }

    String getPassword() {
        String uniqueKey = UUID.randomUUID().toString();
        String[] split = uniqueKey.split("-");
        return split[0];
    }

}
