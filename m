Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EAB568F21
	for <lists+linux-fbdev@lfdr.de>; Wed,  6 Jul 2022 18:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbiGFQ2c (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 6 Jul 2022 12:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbiGFQ2a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 6 Jul 2022 12:28:30 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221E4E0DA
        for <linux-fbdev@vger.kernel.org>; Wed,  6 Jul 2022 09:28:29 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10c0119dd16so11061639fac.6
        for <linux-fbdev@vger.kernel.org>; Wed, 06 Jul 2022 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=jfxR98uW8mivqMQRsEutT68oCesPJMze1b9dnufU69LcAb7+VMSEM4kdZmAYz9u9kC
         myMY3CT95YyEVNVHT0KArxREZdMHPMqrXKUNUYWZrWpknz5lG4PMeNH4Hnh5eiit8X+Y
         1BYRHVDlych7JNdKFIssbwoLFrWRUhFPfTpgZJbtijG6wRI02xV3dJNcDYLFoYMNHyBC
         AE61dn3FGsY1Tdl4JEa8rswfKV/qFp1cO9bg6yS2LmslQEObZN1SUmNyumrT7H3N604m
         hI1HOmBpp8eLySQlj25H+6vIfl0EZu3X2KHCxjhljGvy4zZLx1i6/QLsTsXTuDVrzQXh
         qOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=VDXmwsT0x3raYlOwTBe7E9IUayf4farvU+gg5d/xQmNPNlmNBv/YyZaJ8+BrBB3JZQ
         V7Y8pvjAf2DMjywTHEqjs1HQVGtzqu1gJanDFojz8AC+tRyLO290YmlyzwEnvh3BjFcc
         nFKdTgo3UZL8UIdYf8Zmcij3gRLL2jHMr8XT+W+gp2p46oCBvEIGHrAbSvAnuFc5ys93
         3AwZp8zdt8EUtXDK4u99XvkoJBox/vCaHD7xkNznbFmecwPOgfCDmungYU8TIL8qEhc9
         lGRJ/I15oyFEMCRp2tsU+QckH1dGIoq1GBwwgFNWMmGOi5+XpsVAZcgcCl7qqGCrijSY
         zWpA==
X-Gm-Message-State: AJIora+x2lN95yKQT2XsfNA7PF9S5uqpqlcA77RDRjpAdEx/+0YYJ/GS
        cBun9+3lZ4/H9X04G1qGeuZUSb9gDVcW6ykBexU=
X-Google-Smtp-Source: AGRyM1s/X09qgNORRz85jhI+9ILmarjRfTjOEEzd7P7pwaQcCVXR6oA+P6A/wmCJPaeSZ/kSYk0vLFBKB9KYSvYs4GE=
X-Received: by 2002:a05:6870:7022:b0:10b:f0ea:d441 with SMTP id
 u34-20020a056870702200b0010bf0ead441mr12097057oae.39.1657124909133; Wed, 06
 Jul 2022 09:28:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 09:28:28 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 16:28:28 +0000
Message-ID: <CAFSKFDbpVNA81Hkx+=hxnQf-_MX=ibj8SJG+LAUFA94U3fHvYw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
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

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
