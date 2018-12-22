package com.community.bean;/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 *
 */
public class User  implements Serializable

    {

        private static final long serialVersionUID = -7644967201570973657L;
        private float id;
        private String name;

        public float getId() {
            return id;
        }
        public void setId(Long id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        @Override
        public String toString() {
            return "User{" +
                    "id=" + id +
                    ", name='" + name + '\'' +
                    '}';
        }
    }
