Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3DD46FB6C8
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 May 2023 21:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbjEHTiH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 8 May 2023 15:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEHTiG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 8 May 2023 15:38:06 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A471D59DA
        for <linux-fbdev@vger.kernel.org>; Mon,  8 May 2023 12:38:05 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f38c23b06eso8933941cf.3
        for <linux-fbdev@vger.kernel.org>; Mon, 08 May 2023 12:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683574685; x=1686166685;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=nPaJttBJA2Um6jPmsc9WLdICppLL1faSm9IwK8KypVJVD9C16CyUb3Cc8JEP7FkUhD
         jJtHfK3qiw07KlVd0e7/UFJoZgDfiWr817R0FPtMp8cpcydKNNJ2da0W1o1fR3DMmlSP
         BvKSLzUj0YT+grKUzqwCqoUFw+IYqUh9mJ3C1PN5gLr7QKTiAAwA6hjFwfwod2CR3dTQ
         i9N531yd22z2jh9S4FlQi3qmhEpeMjIEFLBbYDHS9TjapmczMisxPCyHY3zvXH63aUOo
         jDnoLQ5oQj57+DKV+7D2Q4odcMai8f2WUDeQZqrXG8qUbhuNkP3k5mg67q6sPLPg3bWh
         zpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574685; x=1686166685;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=VwUMIAA9YUY0PLvbs8rn/rURrdpWEQTiv17kyTy9LgzfpxfBSsm9Hcxr9PXVIbG2r3
         XZGRECpqAFju+zXQNElHbn8Edii6GmWfz4LecquSRmnlaQATAmeTnkejjHL6hBlvJCum
         nEIX0cfYfdvFEyf0W/TbN5//wLTfg5yGP+E8AvnVdBuhl4zPu84756vyHNXh+e1C2ppM
         Ib55ml+XzbtOdEF8Nz6rqiGocZyzExt5wqTCkWN7yroDl8UF7+emdBBFAXPtjZc+hQeJ
         uv57P+izw4NNSWF6iyKbnEPCzmKT7dP9tuBT4EOa5aw74xDxTI35HXt7crR6ZWvOqqAQ
         GXeg==
X-Gm-Message-State: AC+VfDz8VW7bNGGDepB1c/eFPI9PN2uX+w1p3Ze4JzXbFTj6TVNWiDnG
        puD1txf2QgXjt71nQuME8U5wjdpfxapOB8xAY74=
X-Google-Smtp-Source: ACHHUZ44Lpr8iN4BgjbjGhNPkhn9PjPaqkNFy4VE9iyrUt6Mn8CCX9Mkde8an4fMTPv7VhVvok7klfWOoWHEkD4Pll8=
X-Received: by 2002:ac8:7f47:0:b0:3ee:8baf:29bf with SMTP id
 g7-20020ac87f47000000b003ee8baf29bfmr18453339qtk.42.1683574684733; Mon, 08
 May 2023 12:38:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1a82:b0:3ef:3204:c645 with HTTP; Mon, 8 May 2023
 12:38:04 -0700 (PDT)
Reply-To: pmichae7707@gmail.com
From:   paul michael <anthonykokon37@gmail.com>
Date:   Mon, 8 May 2023 20:38:04 +0100
Message-ID: <CABK1eusMOXt9-Xtcr6zdyMN4pD8km5Ftu7j++hE26=c7Vu=S2Q@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
