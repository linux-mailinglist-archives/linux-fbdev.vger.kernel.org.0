Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C15635FEFA8
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Oct 2022 16:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiJNOEP (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Oct 2022 10:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbiJNODV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Oct 2022 10:03:21 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9ED1D345E
        for <linux-fbdev@vger.kernel.org>; Fri, 14 Oct 2022 07:02:52 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 126so5711920ybw.3
        for <linux-fbdev@vger.kernel.org>; Fri, 14 Oct 2022 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=G+PH3oV0/fTkd6kqy77KyvUT5LK+8noL2kaMeUDKM0/KUjX5fVmwOU7pj05uCBweC8
         xfm0XQu4fzsMxYaUlWBTHA1NO0rYYG6fnB4/3if5ONVXYHLMXveUD/M/7lviH5daLonL
         1t0k2g6akRazJk3OJ6rjefzUeo+n5fS6Scmjj+goc7F2JkZ4PGMqzTHm26y6iCumwU1m
         vByCMq/yUQZSvWbaBn7LngHx/xRJQqKphf+zuqjbrCx7n1UYmzLa43D6NXqWei54EpB5
         Hgmi0GLFxY8pzlb/6GtyjYUMoPXTRSnY82VOoaR3EdwsmOdxyCaDWPgBMAAQObtgOGD5
         TD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=k3OlV0eAxmcailjSZXD5kYngDoyJ86C2FgGQfvGsA/W9HS44yyCE00Edf1rmy6SGrj
         GQoFv7D1LjNbJOHGr2tA4F6FilLxNQugIEYf/56td/atyAKcC3E7kPDlV0SyV8T5VvuU
         ERGIToxxbIkVTXkb90aVBu+iSy2z6K2A3senzyRo+bQL1Hfi4AAV0z/M34n9T8Ey1O7u
         Ml20CoUiOBD1c/lyjXcdVVGaRiIeUWwMBIwjpnvH/Azppai/+GLJ1GGc7HWzvFMhoQPr
         EQvAtCV3aNRtWU8qpdSlxDVTegDja7Wsw1gC/9RppxnPVEKy9rDGjEEU5jZZzG6Ln1Db
         sNyA==
X-Gm-Message-State: ACrzQf1E97mVONyEyYQwYR7jAX+R31yelNGXMX6yWZCQxm+KybsLQtle
        CXRgHHPqCyGFcPgsLYIPplfmO6PUFyNjWRl5YoQ=
X-Google-Smtp-Source: AMsMyM7PquZqT/hWd+Tt0oC61vyT5Qvjw0RxH2sdg1Bi1LtnTo+bFlowOulx3dZrZ5gfCnubsPrMrTQR3ydMcg/g1Ro=
X-Received: by 2002:a05:6902:124d:b0:66d:5ce6:5924 with SMTP id
 t13-20020a056902124d00b0066d5ce65924mr4651776ybu.320.1665756120333; Fri, 14
 Oct 2022 07:02:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:6c05:b0:3c1:5961:57b5 with HTTP; Fri, 14 Oct 2022
 07:01:59 -0700 (PDT)
Reply-To: tatianaarthur72@gmail.com
From:   "Mrs.Tatiana Arthur" <goowjarwq@gmail.com>
Date:   Fri, 14 Oct 2022 16:01:59 +0200
Message-ID: <CAC-x_XG9rA0AyZfYuHNAuuG+d=fYhmCwTNqzUGX7BPC1wG=Shw@mail.gmail.com>
Subject: Did you receive the email I sent you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


