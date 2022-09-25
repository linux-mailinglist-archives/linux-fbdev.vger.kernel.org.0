Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E735D5E9413
	for <lists+linux-fbdev@lfdr.de>; Sun, 25 Sep 2022 17:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIYPrg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 25 Sep 2022 11:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiIYPrf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 25 Sep 2022 11:47:35 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475E62BB23
        for <linux-fbdev@vger.kernel.org>; Sun, 25 Sep 2022 08:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664120848;
        bh=0hkhVjvY/ygZUbAaEfpX1kwcs+jyZLR1+/SmlkcaXAM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=RTJHml5ugJvCJxqeD61QsegCaYnvu2LPCHM3BvmLwFIWy2z29+1u2gKUB6rK4t/j1
         EJKxUd4KTTVM4OXWsOQOcRdAOjQoZyIL77DGwWPYrQUJ8QBfIoaBaeBvA07+a23wt6
         rlcfUUJ6KyXUCSaWyjEy3FnOplybPL0Mes/3Mbbw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.188.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O6Y-1ogKPG0Rm2-003sul; Sun, 25
 Sep 2022 17:47:28 +0200
Message-ID: <37915429-7b4d-6e64-8ef7-a28bf8015fd5@gmx.de>
Date:   Sun, 25 Sep 2022 17:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] video: fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()
Content-Language: en-US
To:     Hyunwoo Kim <imv4bel@gmail.com>, steve.glendinning@shawell.net
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20220925133243.GA383897@ubuntu>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20220925133243.GA383897@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JOrA8gw47agTlXhRZBKS15wNguuEPi83J/XtrK841D6fkqjKHiP
 drFONPGRt13+Yio/Sj9d7lMGu1sdVCJlmNWruESoLoK7TqU4b4twEF/jkxPtz6WOjSYzlLm
 3f/TccRlTxV3TiZ++MI8Pv2aHpyOMP50rYwft4Gg5iRs3onxe7nED+yz/uwsxORN/6lhxBG
 MtQNZt6vP7XyTIIfQsp4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:02U4KP+3IWs=:QXlh9eICwJQxLAqYIdOkfN
 9HNMY9c0jONgByg7LEmu21p6kbqbF/7kQPaP1GvEJFhdsNGi5GoQu3UeTtWW9LN1PZ5wcBiMO
 B6+ACAOlffqeA+yyMk5TMU7K9XzMyIN6KhpivfVXeYfcBJsLaJ1whcM2OZJoS5QM0EMoVVmyq
 AF9dP+H3+ssSF28hQbySsIWT6VhiPZE64zony48o1gjOq0VKoYJ7gX5Fiq1dN01NNzuSffiZ9
 k4Tkib5w2w9c5DJ4ZSGSyr8VHcRid2rs8wDoF+8eMh2oex4JbfJIoBRlaLIeUv/mB6kfNx1UV
 XrJOIc1ua2FqybjA4WL2LPdlFANf4FOUeXQ7roHt9Vd/xFMdg5SH2AMMQiGlQEB8ohMz+6zGU
 nBxYuxg6sAUrVMEKYSgIiT5KuY9L7pNRZE6mxXN/od+HaPMb7R7TOIwo/WJGeyuZZeZlkG9Sw
 MxhNFSEJ5m1NrFjbobm8w31uZSr+Ne3Vk5XdJVeJI9eMiV7Sx74JN0x1PoKdKp1iJ38Dp9aRX
 hRHSKDVgpDw4+UyFdnk0ojkBW7nMqHT3aM31LbdH042i9wSvRu2WeHLjjBjYTB5UmovMbpdn0
 dJxU8yAG02iya5Hr8Gj8lTJqwIXYMdNqtbyvTs7E8iHkvtGThxERhOepALshC3+o0LN9UxVwn
 1oppx3QtQMmzzqgJ7bwSfFwbbhP28eWCY7sZFOilXCoOcU1IRZRTW1zA7sY7Fu9GRvrh61Gv2
 8AAg47xS+KRG5n1fbgyUffinVNTq5k4o3IdUWgqOyjcmJ17zLAkpSZCdT9V+mPIwcp3oKcrd4
 NNIGvNIrpPoiWMQ8p+kNkbsaTIZMVZo4GyIDYXYjGDzTKBUGPNciF4G4T2Kfs6P75q+X2tQX9
 cekbQxVpwcK5kJm48FFrUME9sXBIzPlsMCNQjPkr/HzKbba+2vdrFP2MHJsN+09tWk5TfVbqJ
 197JTPVZFioiv7ybAtaZY4svmROYMVBTpvk/b3fI5xit9RptbG5AV1ZRImGoPlHiotAtXA8Om
 k9JATfgNGA4DAq2LFo+rIGaBKR5I9P8I6eqjhKkVG5SDbmOaW6m4AwFCAT4XZyCwBRyhAVyj9
 1jMNOgK1SJAt9VQ7L7j9EC+Aet2FOCPPuca5lf+tWG/aHZk+Efx4si9550DS+NKM/jUAAXZBG
 HSdgnoDCSE+2zxpIjA4LZ2I2O2
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 9/25/22 15:32, Hyunwoo Kim wrote:
> A race condition may occur if the user physically removes the
> USB device while calling open() for this device node.
>
> This is a race condition between the ufx_ops_open() function and
> the ufx_usb_disconnect() function, which may eventually result in UAF.
>
> So, add a mutex to the ufx_ops_open() and ufx_usb_disconnect() functions
> to avoid race contidion of krefs.
>
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

applied.

Thanks!
Helge
