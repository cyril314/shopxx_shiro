package com.fit.util;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;

import javax.crypto.Cipher;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.util.Assert;

/**
 * Utils - RSA加密解密
 */
public final class RSAUtils {

    /**
     * 密钥大小
     */
    private static final int KEY_SIZE = 1024;

    /**
     * 不可实例化
     */
    private RSAUtils() {
    }

    /**
     * 生成密钥对
     *
     * @return 密钥对
     */
    public static KeyPair generateKeyPair() {
        try {
            KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
            keyPairGenerator.initialize(KEY_SIZE, new SecureRandom());
            return keyPairGenerator.generateKeyPair();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    /**
     * 加密
     *
     * @param publicKey 公钥
     * @param data      数据
     * @return 加密后的数据
     */
    public static byte[] encrypt(PublicKey publicKey, byte[] data) {
        Assert.notNull(publicKey, "Public key must not be null");
        Assert.notNull(data, "Data must not be null");
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            return cipher.doFinal(data);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 加密
     *
     * @param publicKey 公钥
     * @param text      字符串
     * @return Base64编码字符串
     */
    public static String encrypt(PublicKey publicKey, String text) {
        Assert.notNull(publicKey, "Public key must not be null");
        Assert.notNull(text, "Text must not be null");
        byte[] data = encrypt(publicKey, text.getBytes());
        return data != null ? Base64.encodeBase64String(data) : null;
    }

    /**
     * 解密
     *
     * @param privateKey 私钥
     * @param data       数据
     * @return 解密后的数据
     */
    public static byte[] decrypt(PrivateKey privateKey, byte[] data) {
        Assert.notNull(privateKey, "Private key must not be null");
        Assert.notNull(data, "Data must not be null");
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            return cipher.doFinal(data);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 解密
     *
     * @param privateKey 私钥
     * @param text       Base64编码字符串
     * @return 解密后的数据
     */
    public static String decrypt(PrivateKey privateKey, String text) {
        Assert.notNull(privateKey, "Private key must not be null");
        Assert.notNull(text, "Text must not be null");
        byte[] data = decrypt(privateKey, Base64.decodeBase64(text));
        return data != null ? new String(data) : null;
    }
}
