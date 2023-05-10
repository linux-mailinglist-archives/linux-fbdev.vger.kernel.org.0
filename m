Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5166FD414
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 May 2023 05:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbjEJDNx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 9 May 2023 23:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjEJDNw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 9 May 2023 23:13:52 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7B335B7
        for <linux-fbdev@vger.kernel.org>; Tue,  9 May 2023 20:13:49 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-61cd6191a62so31292626d6.3
        for <linux-fbdev@vger.kernel.org>; Tue, 09 May 2023 20:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683688428; x=1686280428;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T66vvnxTdj2cLyhEViaZZN8WST3UIVtt5NHHph0IAcE=;
        b=FhYzMUSG23YXL+rg7JAB9TM+zAGjwOqSF+3DXK1Tf5N8DoOVJcPN7uA3ajAlMVSm3t
         wfdPA5r2fA4iDZkO35gnWnXRXzq5fA2dES6LTn5CmH1sU3zXAcc/lo2iGyP5XHTcXjHE
         iJZvdH5HOfUOQmMQ6Epzfg7qDTdZJyuS5W2VvHdbcxCjEtNc4dlz5/8bsUR/vuQ1HFVe
         zkLHl9U2i4eKy0dwiM8gSALT9nzLXyk1v8g0Tt9E2EJDZoZ5fdtEsYxE2Y5EbLWlf1TT
         FCyOkR8JaH8xdE7nWAhag+aA4qKpdme44mxCX0pjAlERCG3AbOqQijg74oHucXBJjvfa
         YKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683688428; x=1686280428;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T66vvnxTdj2cLyhEViaZZN8WST3UIVtt5NHHph0IAcE=;
        b=DQE5nkvcgABfXbIclocpT3oX+ZVF6QqkWb2EbulC8GTZPkQlEKMqP+9viNUxunyhOG
         4Tv4Pv4Ygu4uKg1/dPMXrVs191EIOkXhn3WeOt2+XYp84rlcl2jiS37X0BOk8HmKF4d0
         KNRF7q5CQgDVVn/mCcZYvZb0+reZDJafzLGsDN02OLV9Q/c0DsZbLaXjCZ4MVE1fHWYk
         d8HyRBMiMTwQ3+9mPkNOdl0q5IQjy+VNrs8kDW3G4aOZxVgaSXjvZPXd+RgfPMSSM5qy
         EQvt17Bkudj8wywGxO90AuUDXA3zpN7bXK5cH3pA711pu0bqpzf0mqHWP50RXZ+gwbxK
         o96Q==
X-Gm-Message-State: AC+VfDxiXWxDH7432oGJ1jMNnYbJxvTAmgOKf7KSQ42E3pIt/HsgqNBO
        j12eRYxIT1l70rJ69M2/T18YlwOVtspU5RrZlvQ=
X-Google-Smtp-Source: ACHHUZ6fOPzv+qaG/bKOnKDwwpOu2rh7rTttcvYKGShomthRhxp51skD7TNJZLPZVUhLnJ9w8D2uGogNzCd/n+BelDc=
X-Received: by 2002:a05:6214:e66:b0:61b:7625:160e with SMTP id
 jz6-20020a0562140e6600b0061b7625160emr24402109qvb.21.1683688427568; Tue, 09
 May 2023 20:13:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e50a:0:b0:61b:5f2d:371e with HTTP; Tue, 9 May 2023
 20:13:46 -0700 (PDT)
Reply-To: fcmb.b@aol.com
From:   Mr Douglas Smith <dpbruceanderson@gmail.com>
Date:   Wed, 10 May 2023 04:13:46 +0100
Message-ID: <CAMKiCjtgR+RUZ_9sxgL1k6pY-sjRWpD3xchFKO5y7jKH4n0rpQ@mail.gmail.com>
Subject: BETALINGSMACHTIGINGSOPDRACHT,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UPPERCASE_75_100 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

BETALINGSMACHTIGINGSOPDRACHT,

BESTE BEGUNSTIGDE,

UW VERLATEN ERFENISFONDS, TER WAARDE VAN $ 23,5 MILJOEN, IS GEWEEST
GOEDGEKEURD DOOR DE VERENIGDE NATIES OM U VIA FCMB BANK IN DE
NIGERIA. OM DEZE REDEN MOET U ONMIDDELLIJK CONTACT MET ONS OPNEMEN @
fcmb.b@aol.com ZODAT WE U RECHTSTREEKS MET DE BANKEN KUNNEN VERBINDEN
KLANTENSERVICE VOOR DE BETALING MET ATM MASTER CARD OF ONLINE BANKING
,

CONTACTEER ONS ONMIDDELLIJK NA ONTVANGST VAN DIT BERICHT VOOR MEER DETAILS.
IN AFWACHTING VAN UW DRINGEND ANTWOORD.
GROETEN
Dhr. DOUGLAS SMITH
fcmb.b@aol.com
